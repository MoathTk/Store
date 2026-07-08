import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../customers/presentation/providers/customer_provider.dart';
import '../../../products/presentation/providers/product_provider.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../providers/order_provider.dart';
import 'order_action_menu.dart';
import 'order_avatar.dart';
import 'order_items_table.dart';
import 'order_status_badge.dart';
import 'order_update_dialog.dart';
import 'order_delete_dialog.dart';

class OrderCard extends StatefulWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _expanded = false;

  Color _statusColor(OrderStatus status, ColorScheme colors) {
    return switch (status) {
      OrderStatus.done => Colors.green,
      OrderStatus.notPaid => Colors.orange,
      OrderStatus.notBought => Colors.blue,
      OrderStatus.cancelled => colors.error,
    };
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final order = widget.order;
    final provider = context.watch<OrderProvider>();
    final customerName = provider.customerNames[order.customerId] ?? '#${order.customerId}';
    final customerPhone = context.watch<CustomerProvider>().allCustomers
        .where((c) => c.id == order.customerId)
        .map((c) => c.phone)
        .firstOrNull;

    final unpaidItems = order.items.where((i) => !i.isPaid).toList();
    final grandTotal = unpaidItems.fold(0, (sum, item) => sum + item.lineTotal);

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => setState(() => _expanded = !_expanded),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: colors.outlineVariant.withValues(alpha: 0.3),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 6,
                  decoration: BoxDecoration(
                    color: _statusColor(order.status, colors),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        _buildHeader(s, colors, order, customerName, grandTotal),
                        const SizedBox(height: 12),
                        _buildCustomerRow(colors, customerName, customerPhone),
                        if (order.items.isNotEmpty) ...[
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                '${unpaidItems.length} ${s.ordersColQty} · ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: colors.onSurface.withValues(alpha: 0.5),
                                ),
                              ),
                              Text(
                                s.ordersTotalPrice(grandTotal.toString()),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (order.notes != null && order.notes!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            order.notes!,
                            style: TextStyle(
                              fontSize: 13,
                              color: colors.onSurface.withValues(alpha: 0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        if (_expanded) ...[
                          const SizedBox(height: 16),
                          OrderItemsTable(items: order.items),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    S s,
    ColorScheme colors,
    Order order,
    String customerName,
    int grandTotal,
  ) {
    return Row(
      children: [
        Text(
          '#${order.id}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '${order.date.year}-${order.date.month.toString().padLeft(2, '0')}-${order.date.day.toString().padLeft(2, '0')}',
          style: TextStyle(
            fontSize: 13,
            color: colors.onSurface.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: colors.primaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            s.ordersTotalPrice(grandTotal.toString()),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: colors.primary,
            ),
          ),
        ),
        const Spacer(),
        OrderStatusBadge(status: order.status),
        const SizedBox(width: 8),
        OrderActionMenu(
          onEdit: () => showDialog(
            context: context,
            builder: (_) => OrderUpdateDialog(order: order),
          ),
          onDelete: () => showDialog(
            context: context,
            builder: (_) => OrderDeleteDialog(
              orderId: order.id,
              onConfirm: () {
                context.read<OrderProvider>().deleteOrder(order.id);
                context.read<ProductProvider>().loadProducts();
              },
            ),
          ),
        ),
        Icon(
          _expanded ? Icons.expand_less : Icons.expand_more,
          size: 20,
          color: colors.onSurface.withValues(alpha: 0.3),
        ),
      ],
    );
  }

  Widget _buildCustomerRow(
    ColorScheme colors,
    String customerName,
    String? customerPhone,
  ) {
    return Row(
      children: [
        OrderAvatar(fullName: customerName),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: colors.onSurface,
              ),
            ),
            if (customerPhone != null && customerPhone.isNotEmpty)
              Text(
                customerPhone,
                style: TextStyle(
                  fontSize: 12,
                  color: colors.onSurface.withValues(alpha: 0.5),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
