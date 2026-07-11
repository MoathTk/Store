import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool hasDropdown;
  final VoidCallback onTap;
  final bool compact;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    this.hasDropdown = false,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (compact) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Material(
          color: isActive ? colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: isActive
                      ? colors.onPrimary
                      : colors.onSurface.withValues(alpha: 0.55),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: isActive ? colors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isActive
                      ? colors.onPrimary
                      : colors.onSurface.withValues(alpha: 0.55),
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isActive
                        ? colors.onPrimary
                        : colors.onSurface.withValues(alpha: 0.55),
                  ),
                ),
                const Spacer(),
                if (hasDropdown)
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 18,
                    color: isActive
                        ? colors.onPrimary
                        : colors.onSurface.withValues(alpha: 0.4),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
