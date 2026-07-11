import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../../core/providers/language_provider.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../providers/navigation_provider.dart';
import 'sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colors = Theme.of(context).colorScheme;
    final nav = context.watch<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final mode = nav.sidebarMode;

    if (mode == SidebarMode.hidden) return const SizedBox.shrink();

    final isRail = mode == SidebarMode.rail;

    return Container(
      width: double.infinity,
      color: colors.surface,
      child: Column(
        children: [
          const SizedBox(height: 32),
          if (!isRail) ...[
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
                    s!.brandName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: colors.onSurface,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () => nav.toggleSidebar(),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        Icons.menu_open_rounded,
                        size: 20,
                        color: colors.onSurface.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            Center(
              child: Container(
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
            ),
            const SizedBox(height: 8),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => nav.toggleSidebar(),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.menu_rounded,
                    size: 20,
                    color: colors.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Divider(
            height: 1,
            color: colors.onSurface.withValues(alpha: 0.08),
            indent: isRail ? 12 : 28,
            endIndent: isRail ? 12 : 28,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: isRail ? const EdgeInsets.symmetric(horizontal: 6) : EdgeInsets.zero,
              children: NavItem.values.map((item) {
                return SidebarItem(
                  icon: item.icon,
                  label: s == null ? '' : navItemLabel(context, item),
                  isActive: nav.activeItem == item,
                  hasDropdown: item.hasDropdown,
                  compact: isRail,
                  onTap: () => nav.select(item),
                );
              }).toList(),
            ),
          ),
          if (!isRail) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SidebarItem(
                icon: Icons.logout_rounded,
                label: s!.navLogout,
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
          ],
          if (!isRail)
            Divider(
              height: 1,
              color: colors.onSurface.withValues(alpha: 0.08),
              indent: 28,
              endIndent: 28,
            ),
          Padding(
            padding: isRail
                ? const EdgeInsets.symmetric(vertical: 8)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () => themeProvider.toggle(),
              child: isRail
                  ? Icon(
                      themeProvider.isDark
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      size: 18,
                      color: colors.onSurface.withValues(alpha: 0.4),
                    )
                  : Row(
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
                          themeProvider.isDark ? s!.modeDark : s!.modeLight,
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: isRail
                ? const EdgeInsets.symmetric(vertical: 8)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () => languageProvider.toggle(),
              child: isRail
                  ? Icon(
                      Icons.language_rounded,
                      size: 18,
                      color: colors.onSurface.withValues(alpha: 0.4),
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.language_rounded,
                          size: 18,
                          color: colors.onSurface.withValues(alpha: 0.4),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          languageProvider.locale.languageCode == 'en'
                              ? 'العربية'
                              : 'English',
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          if (isRail)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
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
                child: Icon(
                  Icons.logout_rounded,
                  size: 18,
                  color: colors.onSurface.withValues(alpha: 0.4),
                ),
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
