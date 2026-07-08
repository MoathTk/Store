import '../../domain/entities/order.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/order_status.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.date,
    required super.customerId,
    super.notes,
    required super.status,
    super.items,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, {List<OrderItem> items = const []}) {
    return OrderModel(
      id: map['id'] as int,
      date: DateTime.parse(map['date'] as String),
      customerId: map['customerId'] as int,
      notes: map['notes'] as String?,
      status: OrderStatus.fromString(map['status'] as String),
      items: items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'customerId': customerId,
      'notes': notes,
      'status': status.value,
    };
  }
}
