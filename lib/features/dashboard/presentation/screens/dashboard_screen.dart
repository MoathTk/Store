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
    final nav = context.watch<NavigationProvider>();
    final activeItem = nav.activeItem;
    final mode = nav.sidebarMode;

    final sidebarWidth = switch (mode) {
      SidebarMode.full => 250.0,
      SidebarMode.rail => 60.0,
      SidebarMode.hidden => 0.0,
    };

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: sidebarWidth,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  border: mode != SidebarMode.hidden
                      ? Border(
                          right: BorderSide(
                            color: colors.onSurface.withValues(alpha: 0.08),
                          ),
                        )
                      : null,
                ),
                child: const Sidebar(),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1400),
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
                    );
                  },
                ),
              ),
            ],
          ),
          if (mode == SidebarMode.hidden)
            Positioned(
              left: 8,
              top: 8,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(12),
                color: colors.surface,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => nav.toggleSidebar(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.menu_rounded,
                      size: 22,
                      color: colors.onSurface,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
