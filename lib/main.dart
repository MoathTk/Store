import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:store_management/generated/l10n.dart';
import 'core/database/database_helper.dart';
import 'core/providers/language_provider.dart';
import 'core/providers/theme_provider.dart';
import 'features/customers/data/datasources/customer_local_datasource.dart';
import 'features/customers/data/repositories/customer_repository_impl.dart';
import 'features/customers/domain/usecases/create_customer_usecase.dart';
import 'features/customers/domain/usecases/delete_customer_usecase.dart';
import 'features/customers/domain/usecases/get_all_customers_usecase.dart';
import 'features/customers/domain/usecases/update_customer_usecase.dart';
import 'features/customers/presentation/providers/customer_provider.dart';
import 'features/products/data/datasources/product_local_datasource.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/usecases/create_product_usecase.dart';
import 'features/products/domain/usecases/delete_product_usecase.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
import 'features/products/domain/usecases/update_product_usecase.dart';
import 'features/products/presentation/providers/product_provider.dart';
import 'features/dashboard/presentation/providers/navigation_provider.dart';
import 'features/orders/data/datasources/order_local_datasource.dart';
import 'features/orders/data/repositories/order_repository_impl.dart';
import 'features/orders/domain/usecases/create_order_usecase.dart';
import 'features/orders/domain/usecases/delete_order_usecase.dart';
import 'features/orders/domain/usecases/get_all_orders_usecase.dart';
import 'features/orders/domain/usecases/mark_order_item_paid_usecase.dart';
import 'features/orders/domain/usecases/update_order_usecase.dart';
import 'features/orders/presentation/providers/order_provider.dart';
import 'features/stores/data/datasources/store_local_datasource.dart';
import 'features/stores/data/repositories/store_repository_impl.dart';
import 'features/stores/presentation/providers/store_provider.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_local_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/sign_up_usecase.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  await DatabaseHelper.instance.database;
  final localDataSource = AuthLocalDataSource();
  final isFirstTime = !(await localDataSource.hasCredentials());
  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    final localDataSource = AuthLocalDataSource();
    final repository = AuthRepositoryImpl(localDataSource);
    final loginUseCase = LoginUseCase(repository);
    final signUpUseCase = SignUpUseCase(repository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(loginUseCase, signUpUseCase),
        ),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(
          create: (_) {
            final dataSource = StoreLocalDataSource(DatabaseHelper.instance);
            final repository = StoreRepositoryImpl(dataSource);
            return StoreProvider(repository)..loadStores();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            final dataSource = CustomerLocalDataSource(DatabaseHelper.instance);
            final repository = CustomerRepositoryImpl(dataSource);
            final getAll = GetAllCustomersUseCase(repository);
            final create = CreateCustomerUseCase(repository);
            final update = UpdateCustomerUseCase(repository);
            final delete = DeleteCustomerUseCase(repository);
            return CustomerProvider(getAll, create, update, delete)
              ..loadCustomers();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            final dataSource = ProductLocalDataSource(DatabaseHelper.instance);
            final repository = ProductRepositoryImpl(dataSource);
            final getAll = GetAllProductsUseCase(repository);
            final create = CreateProductUseCase(repository);
            final update = UpdateProductUseCase(repository);
            final delete = DeleteProductUseCase(repository);
            return ProductProvider(getAll, create, update, delete)
              ..loadProducts();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            final dataSource = OrderLocalDataSource(DatabaseHelper.instance);
            final repository = OrderRepositoryImpl(dataSource);
            final getAll = GetAllOrdersUseCase(repository);
            final create = CreateOrderUseCase(repository);
            final update = UpdateOrderUseCase(repository);
            final delete = DeleteOrderUseCase(repository);
            final markPaid = MarkOrderItemPaidUseCase(repository);
            return OrderProvider(getAll, create, update, delete, markPaid)
              ..loadOrders();
          },
        ),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, _) {
          return MaterialApp(
            onGenerateTitle: (context) => S.of(context)!.appTitle,
            debugShowCheckedModeBanner: false,
            locale: languageProvider.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.mode,
            home: isFirstTime ? const WelcomeScreen() : const LoginScreen(),
          );
        },
      ),
    );
  }
}
