import 'package:flutter/material.dart';
import 'package:store_management/generated/l10n.dart';

class ProductActionMenu extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductActionMenu({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz, size: 20),
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit();
          case 'delete':
            onDelete();
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(value: 'edit', child: Text(s.productsActionEdit)),
        PopupMenuItem(value: 'delete', child: Text(s.productsActionDelete)),
      ],
    );
  }
}
