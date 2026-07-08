import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/order_provider.dart';
import '../../domain/entities/order_status.dart';

class OrderFilterChips extends StatelessWidget {
  const OrderFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<OrderProvider>();

    final chips = [
      (null, s.ordersFilterAll),
      (OrderStatus.done, s.ordersFilterDone),
      (OrderStatus.notPaid, s.ordersFilterNotPaid),
      (OrderStatus.notBought, s.ordersFilterNotBought),
      (OrderStatus.cancelled, s.ordersFilterCancelled),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: chips.map((entry) {
          final (status, label) = entry;
          final isActive = provider.statusFilter == status;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(label),
              selected: isActive,
              onSelected: (_) => provider.filterByStatus(status),
              selectedColor: colors.primaryContainer,
              checkmarkColor: colors.onPrimaryContainer,
              labelStyle: TextStyle(
                fontSize: 13,
                color: isActive
                    ? colors.onPrimaryContainer
                    : colors.onSurface.withValues(alpha: 0.7),
              ),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
            ),
          );
        }).toList(),
      ),
    );
  }
}
