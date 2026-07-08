import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../../../products/presentation/providers/product_provider.dart';
import '../../../stores/presentation/providers/store_provider.dart';
import '../../domain/entities/order_item.dart';
import '../providers/order_provider.dart';

class OrderItemsTable extends StatelessWidget {
  final List<OrderItem> items;

  const OrderItemsTable({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final products = context.watch<ProductProvider>().allProducts;
    final stores = context.watch<StoreProvider>().stores;

    final unpaidItems = items.where((i) => !i.isPaid).toList();
    final grandTotal = unpaidItems.fold(0, (sum, item) => sum + item.lineTotal);

    final headerTextStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: colors.onSurfaceVariant,
      letterSpacing: 0.3,
    );

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 140,
                  child: Text(s.ordersColProduct, style: headerTextStyle),
                ),
                SizedBox(
                  width: 90,
                  child: Text(s.ordersColStore, style: headerTextStyle),
                ),
                SizedBox(
                  width: 50,
                  child: Text(s.ordersColQty, style: headerTextStyle),
                ),
                SizedBox(
                  width: 60,
                  child: Text(s.ordersColPrice, style: headerTextStyle),
                ),
                SizedBox(
                  width: 70,
                  child: Text(s.ordersColLineTotal, style: headerTextStyle),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            ...items.map((item) {
              final product = products.where((p) => p.id == item.itemId).firstOrNull;
              final store = stores.where((s) => s.id == item.storeId).firstOrNull;
              final isPaid = item.isPaid;
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text(
                        product?.name ?? '#${item.itemId}',
                        style: TextStyle(
                          fontSize: 13,
                          color: isPaid
                              ? colors.onSurface.withValues(alpha: 0.35)
                              : colors.onSurface,
                          decoration: isPaid ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Text(
                        store?.name ?? '#${item.storeId}',
                        style: TextStyle(
                          fontSize: 13,
                          color: isPaid
                              ? colors.onSurface.withValues(alpha: 0.35)
                              : colors.onSurface.withValues(alpha: 0.7),
                          decoration: isPaid ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        '${item.totalItems}',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isPaid
                              ? colors.onSurface.withValues(alpha: 0.35)
                              : colors.onSurface,
                          decoration: isPaid ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          color: isPaid
                              ? colors.onSurface.withValues(alpha: 0.35)
                              : colors.onSurface.withValues(alpha: 0.7),
                          decoration: isPaid ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Text(
                        item.lineTotal.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isPaid
                              ? colors.onSurface.withValues(alpha: 0.35)
                              : colors.primary,
                          decoration: isPaid ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                    if (isPaid)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Colors.green.withValues(alpha: 0.6),
                        ),
                      )
                    else
                      IconButton(
                        icon: Icon(
                          Icons.payments_outlined,
                          size: 20,
                          color: colors.primary,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 28,
                          minHeight: 28,
                        ),
                        tooltip: 'Mark as paid',
                        onPressed: () {
                          context.read<OrderProvider>().markItemPaid(item.id);
                        },
                      ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 4),
            if (items.any((i) => i.isPaid))
              Divider(color: colors.outlineVariant.withValues(alpha: 0.4)),
            const SizedBox(height: 4),
            Row(
              children: [
                const Spacer(),
                Text(
                  s.ordersTotalPrice(grandTotal.toString()),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
