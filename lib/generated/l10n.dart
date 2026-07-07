// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Store Management`
  String get appTitle {
    return Intl.message(
      'Store Management',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Store\nManagement`
  String get welcomeTitle {
    return Intl.message(
      'Store\nManagement',
      name: 'welcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Efficiently manage your inventory, sales, and staff in one place.`
  String get welcomeSubtitle {
    return Intl.message(
      'Efficiently manage your inventory, sales, and staff in one place.',
      name: 'welcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get welcomeGetStarted {
    return Intl.message(
      'Get Started',
      name: 'welcomeGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account`
  String get welcomeAlreadyAccount {
    return Intl.message(
      'I already have an account',
      name: 'welcomeAlreadyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get loginTitle {
    return Intl.message(
      'Welcome Back!',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to manage your store`
  String get loginSubtitle {
    return Intl.message(
      'Sign in to manage your store',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get loginUsernameLabel {
    return Intl.message(
      'Username',
      name: 'loginUsernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get loginUsernameError {
    return Intl.message(
      'Enter username',
      name: 'loginUsernameError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginPasswordLabel {
    return Intl.message(
      'Password',
      name: 'loginPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get loginPasswordError {
    return Intl.message(
      'Enter password',
      name: 'loginPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get loginSignIn {
    return Intl.message('Sign In', name: 'loginSignIn', desc: '', args: []);
  }

  /// `Create Account`
  String get signupTitle {
    return Intl.message(
      'Create Account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Set up your credentials to get started`
  String get signupSubtitle {
    return Intl.message(
      'Set up your credentials to get started',
      name: 'signupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get signupConfirmLabel {
    return Intl.message(
      'Confirm Password',
      name: 'signupConfirmLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get signupConfirmErrorEmpty {
    return Intl.message(
      'Confirm your password',
      name: 'signupConfirmErrorEmpty',
      desc: '',
      args: [],
    );
  }

  /// `At least 6 characters`
  String get signupPasswordMinLength {
    return Intl.message(
      'At least 6 characters',
      name: 'signupPasswordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get signupConfirmErrorMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'signupConfirmErrorMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signupCreateAccount {
    return Intl.message(
      'Create Account',
      name: 'signupCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `No account found. Please sign up first.`
  String get errorNoAccount {
    return Intl.message(
      'No account found. Please sign up first.',
      name: 'errorNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username or password.`
  String get errorInvalidCredentials {
    return Intl.message(
      'Invalid username or password.',
      name: 'errorInvalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get brandName {
    return Intl.message('Light', name: 'brandName', desc: '', args: []);
  }

  /// `Dashboard`
  String get navDashboard {
    return Intl.message('Dashboard', name: 'navDashboard', desc: '', args: []);
  }

  /// `Stores`
  String get navStores {
    return Intl.message('Stores', name: 'navStores', desc: '', args: []);
  }

  /// `Order`
  String get navOrder {
    return Intl.message('Order', name: 'navOrder', desc: '', args: []);
  }

  /// `Product`
  String get navProduct {
    return Intl.message('Product', name: 'navProduct', desc: '', args: []);
  }

  /// `Customer`
  String get navCustomer {
    return Intl.message('Customer', name: 'navCustomer', desc: '', args: []);
  }

  /// `Employee`
  String get navEmployee {
    return Intl.message('Employee', name: 'navEmployee', desc: '', args: []);
  }

  /// `Billing`
  String get navBilling {
    return Intl.message('Billing', name: 'navBilling', desc: '', args: []);
  }

  /// `Analytics`
  String get navAnalytics {
    return Intl.message('Analytics', name: 'navAnalytics', desc: '', args: []);
  }

  /// `Setting`
  String get navSetting {
    return Intl.message('Setting', name: 'navSetting', desc: '', args: []);
  }

  /// `Help`
  String get navHelp {
    return Intl.message('Help', name: 'navHelp', desc: '', args: []);
  }

  /// `Log out`
  String get navLogout {
    return Intl.message('Log out', name: 'navLogout', desc: '', args: []);
  }

  /// `Dark Mode`
  String get modeDark {
    return Intl.message('Dark Mode', name: 'modeDark', desc: '', args: []);
  }

  /// `Light Mode`
  String get modeLight {
    return Intl.message('Light Mode', name: 'modeLight', desc: '', args: []);
  }

  /// `{label} Page`
  String placeholderPage(Object label) {
    return Intl.message(
      '$label Page',
      name: 'placeholderPage',
      desc: '',
      args: [label],
    );
  }

  /// `Stores`
  String get storesTitle {
    return Intl.message('Stores', name: 'storesTitle', desc: '', args: []);
  }

  /// `Add store`
  String get storesAddTooltip {
    return Intl.message(
      'Add store',
      name: 'storesAddTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Add Store`
  String get storesAddDialogTitle {
    return Intl.message(
      'Add Store',
      name: 'storesAddDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Store name`
  String get storesAddHint {
    return Intl.message(
      'Store name',
      name: 'storesAddHint',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get storesAddCancel {
    return Intl.message('Cancel', name: 'storesAddCancel', desc: '', args: []);
  }

  /// `Create`
  String get storesAddCreate {
    return Intl.message('Create', name: 'storesAddCreate', desc: '', args: []);
  }

  /// `No stores yet`
  String get storesEmptyTitle {
    return Intl.message(
      'No stores yet',
      name: 'storesEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add your first store to get started`
  String get storesEmptySubtitle {
    return Intl.message(
      'Add your first store to get started',
      name: 'storesEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load stores`
  String get storesErrorTitle {
    return Intl.message(
      'Failed to load stores',
      name: 'storesErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Store`
  String get storesDeleteTitle {
    return Intl.message(
      'Delete Store',
      name: 'storesDeleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete "{name}"?`
  String storesDeleteConfirm(Object name) {
    return Intl.message(
      'Are you sure you want to delete "$name"?',
      name: 'storesDeleteConfirm',
      desc: '',
      args: [name],
    );
  }

  /// `Cancel`
  String get storesDeleteCancel {
    return Intl.message(
      'Cancel',
      name: 'storesDeleteCancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get storesDeleteButton {
    return Intl.message(
      'Delete',
      name: 'storesDeleteButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
