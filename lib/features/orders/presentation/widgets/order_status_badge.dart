import 'package:flutter/material.dart';
import 'package:store_management/generated/l10n.dart';
import '../../domain/entities/order_status.dart';

class OrderStatusBadge extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;

    final (Color bg, Color fg, Color strip, String label) = switch (status) {
      OrderStatus.cancelled => (
        colors.errorContainer,
        colors.onErrorContainer,
        colors.error,
        s.ordersStatusCancelled,
      ),
      OrderStatus.done => (
        colors.tertiaryContainer,
        colors.onTertiaryContainer,
        colors.tertiary,
        s.ordersStatusDone,
      ),
      OrderStatus.notBought => (
        colors.secondaryContainer,
        colors.onSecondaryContainer,
        colors.secondary,
        s.ordersStatusNotBought,
      ),
      OrderStatus.notPaid => (
        colors.errorContainer.withValues(alpha: 0.6),
        colors.onErrorContainer,
        Colors.orange,
        s.ordersStatusNotPaid,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }

  Color get stripColor {
    return switch (status) {
      OrderStatus.cancelled => Colors.grey,
      OrderStatus.done => Colors.green,
      OrderStatus.notBought => Colors.amber,
      OrderStatus.notPaid => Colors.orange,
    };
  }
}
