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

  static String m0(label) => "${label} Page";

  static String m1(name) => "Are you sure you want to delete \"${name}\"?";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage("Store Management"),
    "brandName": MessageLookupByLibrary.simpleMessage("Light"),
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
    "placeholderPage": m0,
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
    "storesDeleteConfirm": m1,
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
