// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Are you sure you want to delete \"${name}\"?";

  static String m1(id) => "Are you sure you want to delete order #${id}?";

  static String m2(count, total) => "${count} items · ${total} pcs";

  static String m3(boxes) => "Max ${boxes} boxes available";

  static String m4(count) => "${count}d ago";

  static String m5(count) => "${count}h ago";

  static String m6(count) => "${count}m ago";

  static String m7(count) => "${count}mo ago";

  static String m8(count) => "${count}y ago";

  static String m9(phone) => "Phone: ${phone}";

  static String m10(total) => "Total: E£ ${total}";

  static String m11(label) => "${label} Page";

  static String m12(name) => "Are you sure you want to delete \"${name}\"?";

  static String m13(id) =>
      "No store exists with ID ${id}. Please add the store first.";

  static String m14(name) => "Are you sure you want to delete \"${name}\"?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Store Management"),
    "brandName": MessageLookupByLibrary.simpleMessage("Light"),
    "customersActionDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "customersActionEdit": MessageLookupByLibrary.simpleMessage("Edit"),
    "customersAddAddressHint": MessageLookupByLibrary.simpleMessage("Address"),
    "customersAddCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "customersAddCreate": MessageLookupByLibrary.simpleMessage("Create"),
    "customersAddDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Add Customer",
    ),
    "customersAddFullNameError": MessageLookupByLibrary.simpleMessage(
      "Enter full name",
    ),
    "customersAddFullNameHint": MessageLookupByLibrary.simpleMessage(
      "Full Name",
    ),
    "customersAddNew": MessageLookupByLibrary.simpleMessage("Add New"),
    "customersAddNotesHint": MessageLookupByLibrary.simpleMessage("Notes"),
    "customersAddPhoneHint": MessageLookupByLibrary.simpleMessage(
      "Phone Number",
    ),
    "customersAddPlaceHint": MessageLookupByLibrary.simpleMessage("Place"),
    "customersAddTypeLabel": MessageLookupByLibrary.simpleMessage("Type"),
    "customersColAddress": MessageLookupByLibrary.simpleMessage("Address"),
    "customersColFullName": MessageLookupByLibrary.simpleMessage("Full Name"),
    "customersColId": MessageLookupByLibrary.simpleMessage("ID"),
    "customersColNotes": MessageLookupByLibrary.simpleMessage("Notes"),
    "customersColPhone": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "customersColPlace": MessageLookupByLibrary.simpleMessage("Place"),
    "customersColType": MessageLookupByLibrary.simpleMessage("Type"),
    "customersDeleteButton": MessageLookupByLibrary.simpleMessage("Delete"),
    "customersDeleteCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "customersDeleteConfirm": m0,
    "customersDeleteTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Customer",
    ),
    "customersEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Add your first customer to get started",
    ),
    "customersEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "No customers yet",
    ),
    "customersErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Failed to load customers",
    ),
    "customersExport": MessageLookupByLibrary.simpleMessage("Export"),
    "customersExportComingSoon": MessageLookupByLibrary.simpleMessage(
      "Coming soon",
    ),
    "customersNext": MessageLookupByLibrary.simpleMessage("Next >"),
    "customersPrevious": MessageLookupByLibrary.simpleMessage("< Previous"),
    "customersSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search by name or phone",
    ),
    "customersTitle": MessageLookupByLibrary.simpleMessage("Customers"),
    "customersTypeNormal": MessageLookupByLibrary.simpleMessage("Normal"),
    "customersTypeProvider": MessageLookupByLibrary.simpleMessage("Provider"),
    "customersTypeProviderAndCustomer": MessageLookupByLibrary.simpleMessage(
      "Provider & Customer",
    ),
    "customersUpdateDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Update Customer",
    ),
    "customersUpdateSave": MessageLookupByLibrary.simpleMessage("Save"),
    "errorInvalidCredentials": MessageLookupByLibrary.simpleMessage(
      "Invalid username or password.",
    ),
    "errorNoAccount": MessageLookupByLibrary.simpleMessage(
      "No account found. Please sign up first.",
    ),
    "loginForgotPassword": MessageLookupByLibrary.simpleMessage(
      "Forgot Password?",
    ),
    "loginPasswordError": MessageLookupByLibrary.simpleMessage(
      "Enter password",
    ),
    "loginPasswordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "loginSignIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "loginSubtitle": MessageLookupByLibrary.simpleMessage(
      "Sign in to manage your store",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
    "loginUsernameError": MessageLookupByLibrary.simpleMessage(
      "Enter username",
    ),
    "loginUsernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
    "modeDark": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "modeLight": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "navAnalytics": MessageLookupByLibrary.simpleMessage("Analytics"),
    "navBilling": MessageLookupByLibrary.simpleMessage("Billing"),
    "navCustomer": MessageLookupByLibrary.simpleMessage("Customer"),
    "navDashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "navEmployee": MessageLookupByLibrary.simpleMessage("Employee"),
    "navHelp": MessageLookupByLibrary.simpleMessage("Help"),
    "navLogout": MessageLookupByLibrary.simpleMessage("Log out"),
    "navOrder": MessageLookupByLibrary.simpleMessage("Order"),
    "navProduct": MessageLookupByLibrary.simpleMessage("Product"),
    "navSetting": MessageLookupByLibrary.simpleMessage("Setting"),
    "navStores": MessageLookupByLibrary.simpleMessage("Stores"),
    "ordersActionDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "ordersActionEdit": MessageLookupByLibrary.simpleMessage("Edit"),
    "ordersAddBoxesHint": MessageLookupByLibrary.simpleMessage("Boxes"),
    "ordersAddCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "ordersAddCreate": MessageLookupByLibrary.simpleMessage("Create"),
    "ordersAddCustomerHint": MessageLookupByLibrary.simpleMessage("Customer"),
    "ordersAddCustomerSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search customer by name or ID",
    ),
    "ordersAddDateHint": MessageLookupByLibrary.simpleMessage("Date"),
    "ordersAddDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Create Order",
    ),
    "ordersAddFillHint": MessageLookupByLibrary.simpleMessage("Items per Box"),
    "ordersAddItem": MessageLookupByLibrary.simpleMessage("Add Item"),
    "ordersAddNew": MessageLookupByLibrary.simpleMessage("New Order"),
    "ordersAddNewCustomer": MessageLookupByLibrary.simpleMessage(
      "Add Customer",
    ),
    "ordersAddNotesHint": MessageLookupByLibrary.simpleMessage("Notes"),
    "ordersAddPriceHint": MessageLookupByLibrary.simpleMessage(
      "Price per item",
    ),
    "ordersAddRemoveItem": MessageLookupByLibrary.simpleMessage("Remove"),
    "ordersAddStatusLabel": MessageLookupByLibrary.simpleMessage("Status"),
    "ordersAddTotalLabel": MessageLookupByLibrary.simpleMessage("Total Items:"),
    "ordersColLineTotal": MessageLookupByLibrary.simpleMessage("Line Total"),
    "ordersColPrice": MessageLookupByLibrary.simpleMessage("Unit Price"),
    "ordersColProduct": MessageLookupByLibrary.simpleMessage("Product"),
    "ordersColQty": MessageLookupByLibrary.simpleMessage("Qty"),
    "ordersColStore": MessageLookupByLibrary.simpleMessage("Store"),
    "ordersCustomerCreatedSnackbar": MessageLookupByLibrary.simpleMessage(
      "Customer added successfully",
    ),
    "ordersDeleteButton": MessageLookupByLibrary.simpleMessage("Delete"),
    "ordersDeleteCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "ordersDeleteConfirm": m1,
    "ordersDeleteTitle": MessageLookupByLibrary.simpleMessage("Delete Order"),
    "ordersEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Create your first order to get started",
    ),
    "ordersEmptyTitle": MessageLookupByLibrary.simpleMessage("No orders yet"),
    "ordersErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Failed to load orders",
    ),
    "ordersExport": MessageLookupByLibrary.simpleMessage("Export"),
    "ordersExportComingSoon": MessageLookupByLibrary.simpleMessage(
      "Coming soon",
    ),
    "ordersFilterAll": MessageLookupByLibrary.simpleMessage("All"),
    "ordersFilterCancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "ordersFilterDone": MessageLookupByLibrary.simpleMessage("Done"),
    "ordersFilterNotBought": MessageLookupByLibrary.simpleMessage("Not Bought"),
    "ordersFilterNotPaid": MessageLookupByLibrary.simpleMessage("Not Paid"),
    "ordersItemsLabel": m2,
    "ordersMaxBoxesError": m3,
    "ordersNoCustomers": MessageLookupByLibrary.simpleMessage(
      "No customers found. Add customers first.",
    ),
    "ordersNoCustomersFound": MessageLookupByLibrary.simpleMessage(
      "No customers found",
    ),
    "ordersPaidDays": m4,
    "ordersPaidHours": m5,
    "ordersPaidJustNow": MessageLookupByLibrary.simpleMessage("just now"),
    "ordersPaidMinutes": m6,
    "ordersPaidMonths": m7,
    "ordersPaidYears": m8,
    "ordersPhoneLabel": m9,
    "ordersSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search by ID or customer",
    ),
    "ordersStatusCancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "ordersStatusDone": MessageLookupByLibrary.simpleMessage("Done"),
    "ordersStatusNotBought": MessageLookupByLibrary.simpleMessage("Not Bought"),
    "ordersStatusNotPaid": MessageLookupByLibrary.simpleMessage("Not Paid"),
    "ordersTitle": MessageLookupByLibrary.simpleMessage("Orders"),
    "ordersTotalPrice": m10,
    "ordersUpdateDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Update Order",
    ),
    "ordersUpdateSave": MessageLookupByLibrary.simpleMessage("Save"),
    "placeholderPage": m11,
    "productsActionDelete": MessageLookupByLibrary.simpleMessage("Delete"),
    "productsActionEdit": MessageLookupByLibrary.simpleMessage("Edit"),
    "productsAddBoxHint": MessageLookupByLibrary.simpleMessage(
      "Number of Boxes",
    ),
    "productsAddCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "productsAddCreate": MessageLookupByLibrary.simpleMessage("Create"),
    "productsAddCurrentStateHint": MessageLookupByLibrary.simpleMessage(
      "Current Total Items",
    ),
    "productsAddDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Add Product",
    ),
    "productsAddFillHint": MessageLookupByLibrary.simpleMessage(
      "Items per Box",
    ),
    "productsAddNameError": MessageLookupByLibrary.simpleMessage(
      "Enter product name",
    ),
    "productsAddNameHint": MessageLookupByLibrary.simpleMessage("Product Name"),
    "productsAddNew": MessageLookupByLibrary.simpleMessage("Add New"),
    "productsAddPriceHint": MessageLookupByLibrary.simpleMessage("Unit Price"),
    "productsAddStoreIdHint": MessageLookupByLibrary.simpleMessage("Store ID"),
    "productsColAddedAt": MessageLookupByLibrary.simpleMessage("Date Added"),
    "productsColBox": MessageLookupByLibrary.simpleMessage("Boxes"),
    "productsColCurrentState": MessageLookupByLibrary.simpleMessage(
      "Current Qty",
    ),
    "productsColFill": MessageLookupByLibrary.simpleMessage("Items/Box"),
    "productsColId": MessageLookupByLibrary.simpleMessage("ID"),
    "productsColInitState": MessageLookupByLibrary.simpleMessage("Initial Qty"),
    "productsColName": MessageLookupByLibrary.simpleMessage("Name"),
    "productsColPrice": MessageLookupByLibrary.simpleMessage("Unit Price"),
    "productsColStore": MessageLookupByLibrary.simpleMessage("Store"),
    "productsDeleteButton": MessageLookupByLibrary.simpleMessage("Delete"),
    "productsDeleteCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "productsDeleteConfirm": m12,
    "productsDeleteTitle": MessageLookupByLibrary.simpleMessage(
      "Delete Product",
    ),
    "productsEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Add your first product to get started",
    ),
    "productsEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "No products yet",
    ),
    "productsErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Failed to load products",
    ),
    "productsExport": MessageLookupByLibrary.simpleMessage("Export"),
    "productsExportComingSoon": MessageLookupByLibrary.simpleMessage(
      "Coming soon",
    ),
    "productsSearchHint": MessageLookupByLibrary.simpleMessage(
      "Search by name or ID",
    ),
    "productsStoreNotFound": MessageLookupByLibrary.simpleMessage(
      "Store Not Found",
    ),
    "productsStoreNotFoundMsg": m13,
    "productsTitle": MessageLookupByLibrary.simpleMessage("Products"),
    "productsUpdateDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Update Product",
    ),
    "productsUpdateSave": MessageLookupByLibrary.simpleMessage("Save"),
    "signupConfirmErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Confirm your password",
    ),
    "signupConfirmErrorMismatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "signupConfirmLabel": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "signupCreateAccount": MessageLookupByLibrary.simpleMessage(
      "Create Account",
    ),
    "signupPasswordMinLength": MessageLookupByLibrary.simpleMessage(
      "At least 6 characters",
    ),
    "signupSubtitle": MessageLookupByLibrary.simpleMessage(
      "Set up your credentials to get started",
    ),
    "signupTitle": MessageLookupByLibrary.simpleMessage("Create Account"),
    "storesAddCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "storesAddCreate": MessageLookupByLibrary.simpleMessage("Create"),
    "storesAddDialogTitle": MessageLookupByLibrary.simpleMessage("Add Store"),
    "storesAddHint": MessageLookupByLibrary.simpleMessage("Store name"),
    "storesAddTooltip": MessageLookupByLibrary.simpleMessage("Add store"),
    "storesDeleteButton": MessageLookupByLibrary.simpleMessage("Delete"),
    "storesDeleteCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "storesDeleteConfirm": m14,
    "storesDeleteTitle": MessageLookupByLibrary.simpleMessage("Delete Store"),
    "storesEmptySubtitle": MessageLookupByLibrary.simpleMessage(
      "Add your first store to get started",
    ),
    "storesEmptyTitle": MessageLookupByLibrary.simpleMessage("No stores yet"),
    "storesErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Failed to load stores",
    ),
    "storesTitle": MessageLookupByLibrary.simpleMessage("Stores"),
    "welcomeAlreadyAccount": MessageLookupByLibrary.simpleMessage(
      "I already have an account",
    ),
    "welcomeGetStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
      "Efficiently manage your inventory, sales, and staff in one place.",
    ),
    "welcomeTitle": MessageLookupByLibrary.simpleMessage("Store\nManagement"),
  };
}
