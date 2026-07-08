import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/store_provider.dart';
import 'store_card.dart';
import 'empty_stores.dart';

class StoreGrid extends StatelessWidget {
  const StoreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<StoreProvider>();

    switch (provider.status) {
      case StoreStatus.idle:
      case StoreStatus.loading:
        return Center(
          child: CircularProgressIndicator(color: colors.primary),
        );
      case StoreStatus.failure:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline_rounded, size: 48, color: colors.error),
                const SizedBox(height: 16),
                Text(
                  s.storesErrorTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colors.error,
                  ),
                ),
                if (provider.error != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    provider.error!,
                    style: TextStyle(
                      fontSize: 13,
                      color: colors.error.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      case StoreStatus.success:
        if (provider.stores.isEmpty) return const EmptyStores();
        return LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = (constraints.maxWidth / 240).floor().clamp(1, 6);
            return GridView.builder(
              padding: const EdgeInsets.all(24),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: provider.stores.length,
              itemBuilder: (context, index) {
                final store = provider.stores[index];
                return StoreCard(
                  store: store,
                  onDelete: () => _confirmDelete(context, store.id, store.name),
                );
              },
            );
          },
        );
    }
  }

  void _confirmDelete(BuildContext context, int id, String name) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: colors.surface,
        title: Text(s.storesDeleteTitle, style: TextStyle(color: colors.onSurface)),
        content: Text(
          s.storesDeleteConfirm(name),
          style: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(s.storesDeleteCancel, style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<StoreProvider>().deleteStore(id);
            },
            child: Text(s.storesDeleteButton, style: TextStyle(color: colors.error)),
          ),
        ],
      ),
    );
  }
}
