import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_management/generated/l10n.dart';
import '../providers/order_provider.dart';
import 'order_card.dart';
import 'order_filter_chips.dart';
import 'orders_header.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderProvider>().loadOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final provider = context.watch<OrderProvider>();

    return Scaffold(
      backgroundColor: colors.surface,
      body: Column(
        children: [
          const OrdersHeader(),
          const SizedBox(height: 16),
          const OrderFilterChips(),
          const SizedBox(height: 8),
          Expanded(
            child: _buildBody(s, colors, provider),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(S s, ColorScheme colors, OrderProvider provider) {
    if (provider.status == OrderLoadStatus.loading && provider.allOrders.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null && provider.allOrders.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: colors.error),
            const SizedBox(height: 12),
            Text(
              provider.error!,
              style: TextStyle(color: colors.error),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => provider.loadOrders(),
              child: Text(s.ordersErrorTitle),
            ),
          ],
        ),
      );
    }

    final orders = provider.paginatedOrders;

    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: colors.onSurface.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 16),
            Text(
              s.ordersEmptyTitle,
              style: TextStyle(
                fontSize: 16,
                color: colors.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              s.ordersEmptySubtitle,
              style: TextStyle(
                fontSize: 13,
                color: colors.onSurface.withValues(alpha: 0.35),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 80),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: OrderCard(order: orders[index]),
        );
      },
    );
  }
}
