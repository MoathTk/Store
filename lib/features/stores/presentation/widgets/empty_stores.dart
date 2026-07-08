import 'package:flutter/material.dart';
import 'package:store_management/generated/l10n.dart';

class EmptyStores extends StatelessWidget {
  const EmptyStores({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.store_mall_directory_outlined,
            size: 64,
            color: colors.onSurface.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 20),
          Text(
            s.storesEmptyTitle,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: colors.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.storesEmptySubtitle,
            style: TextStyle(
              fontSize: 14,
              color: colors.onSurface.withValues(alpha: 0.35),
            ),
          ),
        ],
      ),
    );
  }
}
