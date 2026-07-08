import 'package:flutter/material.dart';
import 'package:store_management/generated/l10n.dart';

class OrderDeleteDialog extends StatelessWidget {
  final int orderId;
  final VoidCallback onConfirm;

  const OrderDeleteDialog({
    super.key,
    required this.orderId,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colors.surface,
      title: Text(
        s.ordersDeleteTitle,
        style: TextStyle(color: colors.onSurface),
      ),
      content: Text(
        s.ordersDeleteConfirm(orderId),
        style: TextStyle(color: colors.onSurface.withValues(alpha: 0.7)),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            s.ordersDeleteCancel,
            style: TextStyle(color: colors.onSurface.withValues(alpha: 0.5)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text(
            s.ordersDeleteButton,
            style: TextStyle(color: colors.error),
          ),
        ),
      ],
    );
  }
}
