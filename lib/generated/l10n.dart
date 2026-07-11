import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Store Management'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Store\nManagement'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Efficiently manage your inventory, sales, and staff in one place.'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get welcomeGetStarted;

  /// No description provided for @welcomeAlreadyAccount.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get welcomeAlreadyAccount;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to manage your store'**
  String get loginSubtitle;

  /// No description provided for @loginUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get loginUsernameLabel;

  /// No description provided for @loginUsernameError.
  ///
  /// In en, this message translates to:
  /// **'Enter username'**
  String get loginUsernameError;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get loginPasswordError;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get loginForgotPassword;

  /// No description provided for @loginSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginSignIn;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signupTitle;

  /// No description provided for @signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your credentials to get started'**
  String get signupSubtitle;

  /// No description provided for @signupConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signupConfirmLabel;

  /// No description provided for @signupConfirmErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get signupConfirmErrorEmpty;

  /// No description provided for @signupPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get signupPasswordMinLength;

  /// No description provided for @signupConfirmErrorMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signupConfirmErrorMismatch;

  /// No description provided for @signupCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signupCreateAccount;

  /// No description provided for @errorNoAccount.
  ///
  /// In en, this message translates to:
  /// **'No account found. Please sign up first.'**
  String get errorNoAccount;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password.'**
  String get errorInvalidCredentials;

  /// No description provided for @brandName.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get brandName;

  /// No description provided for @navDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get navDashboard;

  /// No description provided for @navStores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get navStores;

  /// No description provided for @navOrder.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get navOrder;

  /// No description provided for @navProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get navProduct;

  /// No description provided for @navCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get navCustomer;

  /// No description provided for @navEmployee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get navEmployee;

  /// No description provided for @navBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get navBilling;

  /// No description provided for @navAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get navAnalytics;

  /// No description provided for @navSetting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get navSetting;

  /// No description provided for @navHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get navHelp;

  /// No description provided for @navLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get navLogout;

  /// No description provided for @modeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get modeDark;

  /// No description provided for @modeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get modeLight;

  /// No description provided for @placeholderPage.
  ///
  /// In en, this message translates to:
  /// **'{label} Page'**
  String placeholderPage(Object label);

  /// No description provided for @storesTitle.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get storesTitle;

  /// No description provided for @storesAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add store'**
  String get storesAddTooltip;

  /// No description provided for @storesAddDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Store'**
  String get storesAddDialogTitle;

  /// No description provided for @storesAddHint.
  ///
  /// In en, this message translates to:
  /// **'Store name'**
  String get storesAddHint;

  /// No description provided for @storesAddCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get storesAddCancel;

  /// No description provided for @storesAddCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get storesAddCreate;

  /// No description provided for @storesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No stores yet'**
  String get storesEmptyTitle;

  /// No description provided for @storesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first store to get started'**
  String get storesEmptySubtitle;

  /// No description provided for @storesErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load stores'**
  String get storesErrorTitle;

  /// No description provided for @storesDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Store'**
  String get storesDeleteTitle;

  /// No description provided for @storesDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String storesDeleteConfirm(Object name);

  /// No description provided for @storesDeleteCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get storesDeleteCancel;

  /// No description provided for @storesDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get storesDeleteButton;

  /// No description provided for @customersTitle.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customersTitle;

  /// No description provided for @customersExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get customersExport;

  /// No description provided for @customersExportComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get customersExportComingSoon;

  /// No description provided for @customersAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get customersAddNew;

  /// No description provided for @customersColId.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get customersColId;

  /// No description provided for @customersColFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get customersColFullName;

  /// No description provided for @customersColType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get customersColType;

  /// No description provided for @customersColPlace.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get customersColPlace;

  /// No description provided for @customersColAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customersColAddress;

  /// No description provided for @customersColPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get customersColPhone;

  /// No description provided for @customersColNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get customersColNotes;

  /// No description provided for @customersTypeNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get customersTypeNormal;

  /// No description provided for @customersTypeProvider.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get customersTypeProvider;

  /// No description provided for @customersTypeProviderAndCustomer.
  ///
  /// In en, this message translates to:
  /// **'Provider & Customer'**
  String get customersTypeProviderAndCustomer;

  /// No description provided for @customersPrevious.
  ///
  /// In en, this message translates to:
  /// **'< Previous'**
  String get customersPrevious;

  /// No description provided for @customersNext.
  ///
  /// In en, this message translates to:
  /// **'Next >'**
  String get customersNext;

  /// No description provided for @customersEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No customers yet'**
  String get customersEmptyTitle;

  /// No description provided for @customersEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first customer to get started'**
  String get customersEmptySubtitle;

  /// No description provided for @customersErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load customers'**
  String get customersErrorTitle;

  /// No description provided for @customersDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Customer'**
  String get customersDeleteTitle;

  /// No description provided for @customersDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String customersDeleteConfirm(Object name);

  /// No description provided for @customersDeleteCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get customersDeleteCancel;

  /// No description provided for @customersDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get customersDeleteButton;

  /// No description provided for @customersAddDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get customersAddDialogTitle;

  /// No description provided for @customersAddFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get customersAddFullNameHint;

  /// No description provided for @customersAddFullNameError.
  ///
  /// In en, this message translates to:
  /// **'Enter full name'**
  String get customersAddFullNameError;

  /// No description provided for @customersAddTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get customersAddTypeLabel;

  /// No description provided for @customersAddPlaceHint.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get customersAddPlaceHint;

  /// No description provided for @customersAddAddressHint.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get customersAddAddressHint;

  /// No description provided for @customersAddPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get customersAddPhoneHint;

  /// No description provided for @customersAddNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get customersAddNotesHint;

  /// No description provided for @customersAddCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get customersAddCancel;

  /// No description provided for @customersAddCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get customersAddCreate;

  /// No description provided for @customersActionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get customersActionEdit;

  /// No description provided for @customersActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get customersActionDelete;

  /// No description provided for @customersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or phone'**
  String get customersSearchHint;

  /// No description provided for @customersUpdateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Customer'**
  String get customersUpdateDialogTitle;

  /// No description provided for @customersUpdateSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get customersUpdateSave;

  /// No description provided for @productsTitle.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get productsTitle;

  /// No description provided for @productsSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or ID'**
  String get productsSearchHint;

  /// No description provided for @productsExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get productsExport;

  /// No description provided for @productsExportComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get productsExportComingSoon;

  /// No description provided for @productsAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get productsAddNew;

  /// No description provided for @productsColId.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get productsColId;

  /// No description provided for @productsColName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get productsColName;

  /// No description provided for @productsColStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get productsColStore;

  /// No description provided for @productsColBox.
  ///
  /// In en, this message translates to:
  /// **'Boxes'**
  String get productsColBox;

  /// No description provided for @productsColFill.
  ///
  /// In en, this message translates to:
  /// **'Items/Box'**
  String get productsColFill;

  /// No description provided for @productsColInitState.
  ///
  /// In en, this message translates to:
  /// **'Initial Qty'**
  String get productsColInitState;

  /// No description provided for @productsColCurrentState.
  ///
  /// In en, this message translates to:
  /// **'Current Qty'**
  String get productsColCurrentState;

  /// No description provided for @productsColPrice.
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get productsColPrice;

  /// No description provided for @productsAddPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get productsAddPriceHint;

  /// No description provided for @productsColAddedAt.
  ///
  /// In en, this message translates to:
  /// **'Date Added'**
  String get productsColAddedAt;

  /// No description provided for @productsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No products yet'**
  String get productsEmptyTitle;

  /// No description provided for @productsEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your first product to get started'**
  String get productsEmptySubtitle;

  /// No description provided for @productsErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load products'**
  String get productsErrorTitle;

  /// No description provided for @productsAddDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get productsAddDialogTitle;

  /// No description provided for @productsAddNameHint.
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productsAddNameHint;

  /// No description provided for @productsAddNameError.
  ///
  /// In en, this message translates to:
  /// **'Enter product name'**
  String get productsAddNameError;

  /// No description provided for @productsAddStoreIdHint.
  ///
  /// In en, this message translates to:
  /// **'Store ID'**
  String get productsAddStoreIdHint;

  /// No description provided for @productsAddBoxHint.
  ///
  /// In en, this message translates to:
  /// **'Number of Boxes'**
  String get productsAddBoxHint;

  /// No description provided for @productsAddFillHint.
  ///
  /// In en, this message translates to:
  /// **'Items per Box'**
  String get productsAddFillHint;

  /// No description provided for @productsAddCurrentStateHint.
  ///
  /// In en, this message translates to:
  /// **'Current Total Items'**
  String get productsAddCurrentStateHint;

  /// No description provided for @productsAddCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productsAddCancel;

  /// No description provided for @productsAddCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get productsAddCreate;

  /// No description provided for @productsStoreNotFound.
  ///
  /// In en, this message translates to:
  /// **'Store Not Found'**
  String get productsStoreNotFound;

  /// No description provided for @productsStoreNotFoundMsg.
  ///
  /// In en, this message translates to:
  /// **'No store exists with ID {id}. Please add the store first.'**
  String productsStoreNotFoundMsg(Object id);

  /// No description provided for @productsUpdateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get productsUpdateDialogTitle;

  /// No description provided for @productsUpdateSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get productsUpdateSave;

  /// No description provided for @productsDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get productsDeleteTitle;

  /// No description provided for @productsDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String productsDeleteConfirm(Object name);

  /// No description provided for @productsDeleteCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get productsDeleteCancel;

  /// No description provided for @productsDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get productsDeleteButton;

  /// No description provided for @productsActionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get productsActionEdit;

  /// No description provided for @productsActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get productsActionDelete;

  /// No description provided for @ordersTitle.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get ordersTitle;

  /// No description provided for @ordersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by ID or customer'**
  String get ordersSearchHint;

  /// No description provided for @ordersExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get ordersExport;

  /// No description provided for @ordersExportComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get ordersExportComingSoon;

  /// No description provided for @ordersAddNew.
  ///
  /// In en, this message translates to:
  /// **'New Order'**
  String get ordersAddNew;

  /// No description provided for @ordersFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ordersFilterAll;

  /// No description provided for @ordersFilterDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get ordersFilterDone;

  /// No description provided for @ordersFilterNotPaid.
  ///
  /// In en, this message translates to:
  /// **'Not Paid'**
  String get ordersFilterNotPaid;

  /// No description provided for @ordersFilterNotBought.
  ///
  /// In en, this message translates to:
  /// **'Not Bought'**
  String get ordersFilterNotBought;

  /// No description provided for @ordersFilterCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get ordersFilterCancelled;

  /// No description provided for @ordersStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get ordersStatusCancelled;

  /// No description provided for @ordersStatusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get ordersStatusDone;

  /// No description provided for @ordersStatusNotBought.
  ///
  /// In en, this message translates to:
  /// **'Not Bought'**
  String get ordersStatusNotBought;

  /// No description provided for @ordersStatusNotPaid.
  ///
  /// In en, this message translates to:
  /// **'Not Paid'**
  String get ordersStatusNotPaid;

  /// No description provided for @ordersEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get ordersEmptyTitle;

  /// No description provided for @ordersEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your first order to get started'**
  String get ordersEmptySubtitle;

  /// No description provided for @ordersErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load orders'**
  String get ordersErrorTitle;

  /// No description provided for @ordersItemsLabel.
  ///
  /// In en, this message translates to:
  /// **'{count} items · {total} pcs'**
  String ordersItemsLabel(Object count, Object total);

  /// No description provided for @ordersPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone: {phone}'**
  String ordersPhoneLabel(Object phone);

  /// No description provided for @ordersColProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get ordersColProduct;

  /// No description provided for @ordersColStore.
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get ordersColStore;

  /// No description provided for @ordersColQty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get ordersColQty;

  /// No description provided for @ordersActionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get ordersActionEdit;

  /// No description provided for @ordersActionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get ordersActionDelete;

  /// No description provided for @ordersAddDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Order'**
  String get ordersAddDialogTitle;

  /// No description provided for @ordersAddCustomerHint.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get ordersAddCustomerHint;

  /// No description provided for @ordersAddDateHint.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get ordersAddDateHint;

  /// No description provided for @ordersAddStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get ordersAddStatusLabel;

  /// No description provided for @ordersAddNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get ordersAddNotesHint;

  /// No description provided for @ordersAddBoxesHint.
  ///
  /// In en, this message translates to:
  /// **'Boxes'**
  String get ordersAddBoxesHint;

  /// No description provided for @ordersAddFillHint.
  ///
  /// In en, this message translates to:
  /// **'Items per Box'**
  String get ordersAddFillHint;

  /// No description provided for @ordersAddRemoveItem.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get ordersAddRemoveItem;

  /// No description provided for @ordersAddItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get ordersAddItem;

  /// No description provided for @ordersAddTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Items:'**
  String get ordersAddTotalLabel;

  /// No description provided for @ordersAddCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get ordersAddCancel;

  /// No description provided for @ordersAddCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get ordersAddCreate;

  /// No description provided for @ordersNoCustomers.
  ///
  /// In en, this message translates to:
  /// **'No customers found. Add customers first.'**
  String get ordersNoCustomers;

  /// No description provided for @ordersUpdateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Order'**
  String get ordersUpdateDialogTitle;

  /// No description provided for @ordersUpdateSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get ordersUpdateSave;

  /// No description provided for @ordersDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Order'**
  String get ordersDeleteTitle;

  /// No description provided for @ordersDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete order #{id}?'**
  String ordersDeleteConfirm(Object id);

  /// No description provided for @ordersDeleteCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get ordersDeleteCancel;

  /// No description provided for @ordersDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get ordersDeleteButton;

  /// No description provided for @ordersColPrice.
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get ordersColPrice;

  /// No description provided for @ordersColLineTotal.
  ///
  /// In en, this message translates to:
  /// **'Line Total'**
  String get ordersColLineTotal;

  /// No description provided for @ordersAddPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Price per item'**
  String get ordersAddPriceHint;

  /// No description provided for @ordersTotalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total: E£ {total}'**
  String ordersTotalPrice(Object total);

  /// No description provided for @ordersAddCustomerSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search customer by name or ID'**
  String get ordersAddCustomerSearchHint;

  /// No description provided for @ordersAddNewCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get ordersAddNewCustomer;

  /// No description provided for @ordersMaxBoxesError.
  ///
  /// In en, this message translates to:
  /// **'Max {boxes} boxes available'**
  String ordersMaxBoxesError(Object boxes);

  /// No description provided for @ordersNoCustomersFound.
  ///
  /// In en, this message translates to:
  /// **'No customers found'**
  String get ordersNoCustomersFound;

  /// No description provided for @ordersCustomerCreatedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Customer added successfully'**
  String get ordersCustomerCreatedSnackbar;

  /// No description provided for @ordersPaidJustNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get ordersPaidJustNow;

  /// No description provided for @ordersPaidMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String ordersPaidMinutes(Object count);

  /// No description provided for @ordersPaidHours.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String ordersPaidHours(Object count);

  /// No description provided for @ordersPaidDays.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String ordersPaidDays(Object count);

  /// No description provided for @ordersPaidMonths.
  ///
  /// In en, this message translates to:
  /// **'{count}mo ago'**
  String ordersPaidMonths(Object count);

  /// No description provided for @ordersPaidYears.
  ///
  /// In en, this message translates to:
  /// **'{count}y ago'**
  String ordersPaidYears(Object count);
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
