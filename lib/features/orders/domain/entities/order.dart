import 'order_status.dart';
import 'order_item.dart';

class Order {
  final int id;
  final DateTime date;
  final int customerId;
  final String? notes;
  final OrderStatus status;
  final List<OrderItem> items;

  const Order({
    required this.id,
    required this.date,
    required this.customerId,
    this.notes,
    required this.status,
    this.items = const [],
  });
}
