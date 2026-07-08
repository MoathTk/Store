import 'package:flutter/material.dart';
import 'package:store_management/generated/l10n.dart';

enum NavItem {
  dashboard(Icons.dashboard_rounded, false),
  stores(Icons.store_rounded, false),
  order(Icons.shopping_cart_rounded, false),
  product(Icons.inventory_2_rounded, false),
  customer(Icons.people_rounded, false),
  employee(Icons.badge_rounded, false),
  billing(Icons.receipt_long_rounded, false),
  analytics(Icons.analytics_rounded, false),
  setting(Icons.settings_rounded, true),
  help(Icons.help_outline_rounded, false);

  final IconData icon;
  final bool hasDropdown;
  const NavItem(this.icon, this.hasDropdown);
}

String navItemLabel(BuildContext context, NavItem item) {
  final s = S.of(context);
  return switch (item) {
    NavItem.dashboard => s!.navDashboard,
    NavItem.stores => s!.navStores,
    NavItem.order => s!.navOrder,
    NavItem.product => s!.navProduct,
    NavItem.customer => s!.navCustomer,
    NavItem.employee => s!.navEmployee,
    NavItem.billing => s!.navBilling,
    NavItem.analytics => s!.navAnalytics,
    NavItem.setting => s!.navSetting,
    NavItem.help => s!.navHelp,
  };
}

class NavigationProvider extends ChangeNotifier {
  NavItem _activeItem = NavItem.dashboard;

  NavItem get activeItem => _activeItem;

  void select(NavItem item) {
    _activeItem = item;
    notifyListeners();
  }

  void reset() {
    _activeItem = NavItem.dashboard;
    notifyListeners();
  }
}
