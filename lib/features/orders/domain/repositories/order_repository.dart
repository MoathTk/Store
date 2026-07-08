import '../entities/order.dart';
import '../entities/order_status.dart';

class CreateOrderParams {
  final DateTime date;
  final int customerId;
  final String? notes;
  final OrderStatus status;
  final List<CreateOrderItemParams> items;

  const CreateOrderParams({
    required this.date,
    required this.customerId,
    this.notes,
    required this.status,
    required this.items,
  });
}

class CreateOrderItemParams {
  final int itemId;
  final int storeId;
  final int boxes;
  final int fill;
  final int price;

  const CreateOrderItemParams({
    required this.itemId,
    required this.storeId,
    required this.boxes,
    required this.fill,
    required this.price,
  });
}

abstract class OrderRepository {
  Future<List<Order>> getAll();
  Future<Order?> getById(int id);
  Future<Order> create(CreateOrderParams params);
  Future<Order> update({
    required int id,
    DateTime? date,
    int? customerId,
    String? notes,
    OrderStatus? status,
  });
  Future<void> delete(int id);
  Future<Order> markItemPaid(int orderItemId);
}
