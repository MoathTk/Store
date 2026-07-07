import 'package:flutter/material.dart';

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

  String get label => switch (this) {
        NavItem.dashboard => 'Dashboard',
        NavItem.stores => 'Stores',
        NavItem.order => 'Order',
        NavItem.product => 'Product',
        NavItem.customer => 'Customer',
        NavItem.employee => 'Employee',
        NavItem.billing => 'Billing',
        NavItem.analytics => 'Analytics',
        NavItem.setting => 'Setting',
        NavItem.help => 'Help',
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
