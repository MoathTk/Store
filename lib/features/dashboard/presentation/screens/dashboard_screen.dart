import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../customers/presentation/screens/customers_screen.dart';
import '../../../orders/presentation/screens/orders_screen.dart';
import '../../../products/presentation/screens/products_screen.dart';
import '../../../stores/presentation/screens/stores_screen.dart';
import '../providers/navigation_provider.dart';
import '../widgets/sidebar.dart';

class DashboardScreen extends StatelessWidget {
  final String username;

  const DashboardScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final s = S.of(context);
    final activeItem = context.watch<NavigationProvider>().activeItem;

    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Container(
            width: 1,
            color: colors.onSurface.withValues(alpha: 0.08),
          ),
          Expanded(
            child: switch (activeItem) {
              NavItem.stores => const StoresScreen(),
              NavItem.customer => const CustomersScreen(),
              NavItem.product => const ProductsScreen(),
              NavItem.order => const OrdersScreen(),
              _ => Center(
                  child: Text(
                    s!.placeholderPage(navItemLabel(context, activeItem)),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: colors.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ),
            },
          ),
        ],
      ),
    );
  }
}
