import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../providers/navigation_provider.dart';
import 'sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final nav = context.watch<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      width: 250,
      color: colors.surface,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.store_rounded,
                    color: colors.onPrimary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Light',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colors.onSurface,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Divider(
            height: 1,
            color: colors.onSurface.withValues(alpha: 0.08),
            indent: 28,
            endIndent: 28,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: NavItem.values.map((item) {
                return SidebarItem(
                  icon: item.icon,
                  label: item.label,
                  isActive: nav.activeItem == item,
                  hasDropdown: item.hasDropdown,
                  onTap: () => nav.select(item),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SidebarItem(
              icon: Icons.logout_rounded,
              label: 'Log out',
              isActive: false,
              onTap: () {
                context.read<AuthProvider>().reset();
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginScreen(),
                    transitionsBuilder: (_, animation, __, child) =>
                        FadeTransition(opacity: animation, child: child),
                    transitionDuration: const Duration(milliseconds: 600),
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 1,
            color: colors.onSurface.withValues(alpha: 0.08),
            indent: 28,
            endIndent: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GestureDetector(
              onTap: () => themeProvider.toggle(),
              child: Row(
                children: [
                  Icon(
                    themeProvider.isDark
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded,
                    size: 18,
                    color: colors.onSurface.withValues(alpha: 0.4),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    themeProvider.isDark ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(
                      fontSize: 13,
                      color: colors.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
