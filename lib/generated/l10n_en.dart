// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Store Management';

  @override
  String get welcomeTitle => 'Store\nManagement';

  @override
  String get welcomeSubtitle =>
      'Efficiently manage your inventory, sales, and staff in one place.';

  @override
  String get welcomeGetStarted => 'Get Started';

  @override
  String get welcomeAlreadyAccount => 'I already have an account';

  @override
  String get loginTitle => 'Welcome Back!';

  @override
  String get loginSubtitle => 'Sign in to manage your store';

  @override
  String get loginUsernameLabel => 'Username';

  @override
  String get loginUsernameError => 'Enter username';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordError => 'Enter password';

  @override
  String get loginForgotPassword => 'Forgot Password?';

  @override
  String get loginSignIn => 'Sign In';

  @override
  String get signupTitle => 'Create Account';

  @override
  String get signupSubtitle => 'Set up your credentials to get started';

  @override
  String get signupConfirmLabel => 'Confirm Password';

  @override
  String get signupConfirmErrorEmpty => 'Confirm your password';

  @override
  String get signupPasswordMinLength => 'At least 6 characters';

  @override
  String get signupConfirmErrorMismatch => 'Passwords do not match';

  @override
  String get signupCreateAccount => 'Create Account';

  @override
  String get errorNoAccount => 'No account found. Please sign up first.';

  @override
  String get errorInvalidCredentials => 'Invalid username or password.';

  @override
  String get brandName => 'Light';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navStores => 'Stores';

  @override
  String get navOrder => 'Order';

  @override
  String get navProduct => 'Product';

  @override
  String get navCustomer => 'Customer';

  @override
  String get navEmployee => 'Employee';

  @override
  String get navBilling => 'Billing';

  @override
  String get navAnalytics => 'Analytics';

  @override
  String get navSetting => 'Setting';

  @override
  String get navHelp => 'Help';

  @override
  String get navLogout => 'Log out';

  @override
  String get modeDark => 'Dark Mode';

  @override
  String get modeLight => 'Light Mode';

  @override
  String placeholderPage(Object label) {
    return '$label Page';
  }

  @override
  String get storesTitle => 'Stores';

  @override
  String get storesAddTooltip => 'Add store';

  @override
  String get storesAddDialogTitle => 'Add Store';

  @override
  String get storesAddHint => 'Store name';

  @override
  String get storesAddCancel => 'Cancel';

  @override
  String get storesAddCreate => 'Create';

  @override
  String get storesEmptyTitle => 'No stores yet';

  @override
  String get storesEmptySubtitle => 'Add your first store to get started';

  @override
  String get storesErrorTitle => 'Failed to load stores';

  @override
  String get storesDeleteTitle => 'Delete Store';

  @override
  String storesDeleteConfirm(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get storesDeleteCancel => 'Cancel';

  @override
  String get storesDeleteButton => 'Delete';

  @override
  String get customersTitle => 'Customers';

  @override
  String get customersExport => 'Export';

  @override
  String get customersExportComingSoon => 'Coming soon';

  @override
  String get customersAddNew => 'Add New';

  @override
  String get customersColId => 'ID';

  @override
  String get customersColFullName => 'Full Name';

  @override
  String get customersColType => 'Type';

  @override
  String get customersColPlace => 'Place';

  @override
  String get customersColAddress => 'Address';

  @override
  String get customersColPhone => 'Phone Number';

  @override
  String get customersColNotes => 'Notes';

  @override
  String get customersTypeNormal => 'Normal';

  @override
  String get customersTypeProvider => 'Provider';

  @override
  String get customersTypeProviderAndCustomer => 'Provider & Customer';

  @override
  String get customersPrevious => '< Previous';

  @override
  String get customersNext => 'Next >';

  @override
  String get customersEmptyTitle => 'No customers yet';

  @override
  String get customersEmptySubtitle => 'Add your first customer to get started';

  @override
  String get customersErrorTitle => 'Failed to load customers';

  @override
  String get customersDeleteTitle => 'Delete Customer';

  @override
  String customersDeleteConfirm(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get customersDeleteCancel => 'Cancel';

  @override
  String get customersDeleteButton => 'Delete';

  @override
  String get customersAddDialogTitle => 'Add Customer';

  @override
  String get customersAddFullNameHint => 'Full Name';

  @override
  String get customersAddFullNameError => 'Enter full name';

  @override
  String get customersAddTypeLabel => 'Type';

  @override
  String get customersAddPlaceHint => 'Place';

  @override
  String get customersAddAddressHint => 'Address';

  @override
  String get customersAddPhoneHint => 'Phone Number';

  @override
  String get customersAddNotesHint => 'Notes';

  @override
  String get customersAddCancel => 'Cancel';

  @override
  String get customersAddCreate => 'Create';

  @override
  String get customersActionEdit => 'Edit';

  @override
  String get customersActionDelete => 'Delete';

  @override
  String get customersSearchHint => 'Search by name or phone';

  @override
  String get customersUpdateDialogTitle => 'Update Customer';

  @override
  String get customersUpdateSave => 'Save';

  @override
  String get productsTitle => 'Products';

  @override
  String get productsSearchHint => 'Search by name or ID';

  @override
  String get productsExport => 'Export';

  @override
  String get productsExportComingSoon => 'Coming soon';

  @override
  String get productsAddNew => 'Add New';

  @override
  String get productsColId => 'ID';

  @override
  String get productsColName => 'Name';

  @override
  String get productsColStore => 'Store';

  @override
  String get productsColBox => 'Boxes';

  @override
  String get productsColFill => 'Items/Box';

  @override
  String get productsColInitState => 'Initial Qty';

  @override
  String get productsColCurrentState => 'Current Qty';

  @override
  String get productsColPrice => 'Unit Price';

  @override
  String get productsAddPriceHint => 'Unit Price';

  @override
  String get productsColAddedAt => 'Date Added';

  @override
  String get productsEmptyTitle => 'No products yet';

  @override
  String get productsEmptySubtitle => 'Add your first product to get started';

  @override
  String get productsErrorTitle => 'Failed to load products';

  @override
  String get productsAddDialogTitle => 'Add Product';

  @override
  String get productsAddNameHint => 'Product Name';

  @override
  String get productsAddNameError => 'Enter product name';

  @override
  String get productsAddStoreIdHint => 'Store ID';

  @override
  String get productsAddBoxHint => 'Number of Boxes';

  @override
  String get productsAddFillHint => 'Items per Box';

  @override
  String get productsAddCurrentStateHint => 'Current Total Items';

  @override
  String get productsAddCancel => 'Cancel';

  @override
  String get productsAddCreate => 'Create';

  @override
  String get productsStoreNotFound => 'Store Not Found';

  @override
  String productsStoreNotFoundMsg(Object id) {
    return 'No store exists with ID $id. Please add the store first.';
  }

  @override
  String get productsUpdateDialogTitle => 'Update Product';

  @override
  String get productsUpdateSave => 'Save';

  @override
  String get productsDeleteTitle => 'Delete Product';

  @override
  String productsDeleteConfirm(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get productsDeleteCancel => 'Cancel';

  @override
  String get productsDeleteButton => 'Delete';

  @override
  String get productsActionEdit => 'Edit';

  @override
  String get productsActionDelete => 'Delete';

  @override
  String get ordersTitle => 'Orders';

  @override
  String get ordersSearchHint => 'Search by ID or customer';

  @override
  String get ordersExport => 'Export';

  @override
  String get ordersExportComingSoon => 'Coming soon';

  @override
  String get ordersAddNew => 'New Order';

  @override
  String get ordersFilterAll => 'All';

  @override
  String get ordersFilterDone => 'Done';

  @override
  String get ordersFilterNotPaid => 'Not Paid';

  @override
  String get ordersFilterNotBought => 'Not Bought';

  @override
  String get ordersFilterCancelled => 'Cancelled';

  @override
  String get ordersStatusCancelled => 'Cancelled';

  @override
  String get ordersStatusDone => 'Done';

  @override
  String get ordersStatusNotBought => 'Not Bought';

  @override
  String get ordersStatusNotPaid => 'Not Paid';

  @override
  String get ordersEmptyTitle => 'No orders yet';

  @override
  String get ordersEmptySubtitle => 'Create your first order to get started';

  @override
  String get ordersErrorTitle => 'Failed to load orders';

  @override
  String ordersItemsLabel(Object count, Object total) {
    return '$count items · $total pcs';
  }

  @override
  String ordersPhoneLabel(Object phone) {
    return 'Phone: $phone';
  }

  @override
  String get ordersColProduct => 'Product';

  @override
  String get ordersColStore => 'Store';

  @override
  String get ordersColQty => 'Qty';

  @override
  String get ordersActionEdit => 'Edit';

  @override
  String get ordersActionDelete => 'Delete';

  @override
  String get ordersAddDialogTitle => 'Create Order';

  @override
  String get ordersAddCustomerHint => 'Customer';

  @override
  String get ordersAddDateHint => 'Date';

  @override
  String get ordersAddStatusLabel => 'Status';

  @override
  String get ordersAddNotesHint => 'Notes';

  @override
  String get ordersAddBoxesHint => 'Boxes';

  @override
  String get ordersAddFillHint => 'Items per Box';

  @override
  String get ordersAddRemoveItem => 'Remove';

  @override
  String get ordersAddItem => 'Add Item';

  @override
  String get ordersAddTotalLabel => 'Total Items:';

  @override
  String get ordersAddCancel => 'Cancel';

  @override
  String get ordersAddCreate => 'Create';

  @override
  String get ordersNoCustomers => 'No customers found. Add customers first.';

  @override
  String get ordersUpdateDialogTitle => 'Update Order';

  @override
  String get ordersUpdateSave => 'Save';

  @override
  String get ordersDeleteTitle => 'Delete Order';

  @override
  String ordersDeleteConfirm(Object id) {
    return 'Are you sure you want to delete order #$id?';
  }

  @override
  String get ordersDeleteCancel => 'Cancel';

  @override
  String get ordersDeleteButton => 'Delete';

  @override
  String get ordersColPrice => 'Unit Price';

  @override
  String get ordersColLineTotal => 'Line Total';

  @override
  String get ordersAddPriceHint => 'Price per item';

  @override
  String ordersTotalPrice(Object total) {
    return 'Total: E£ $total';
  }

  @override
  String get ordersAddCustomerSearchHint => 'Search customer by name or ID';

  @override
  String get ordersAddNewCustomer => 'Add Customer';

  @override
  String ordersMaxBoxesError(Object boxes) {
    return 'Max $boxes boxes available';
  }

  @override
  String get ordersNoCustomersFound => 'No customers found';

  @override
  String get ordersCustomerCreatedSnackbar => 'Customer added successfully';

  @override
  String get ordersPaidJustNow => 'just now';

  @override
  String ordersPaidMinutes(Object count) {
    return '${count}m ago';
  }

  @override
  String ordersPaidHours(Object count) {
    return '${count}h ago';
  }

  @override
  String ordersPaidDays(Object count) {
    return '${count}d ago';
  }

  @override
  String ordersPaidMonths(Object count) {
    return '${count}mo ago';
  }

  @override
  String ordersPaidYears(Object count) {
    return '${count}y ago';
  }
}
