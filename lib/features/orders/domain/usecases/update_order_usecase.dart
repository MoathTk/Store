import '../entities/order.dart';
import '../entities/order_status.dart';
import '../repositories/order_repository.dart';

class UpdateOrderUseCase {
  final OrderRepository repository;

  const UpdateOrderUseCase(this.repository);

  Future<Order> execute({
    required int id,
    DateTime? date,
    int? customerId,
    String? notes,
    OrderStatus? status,
  }) => repository.update(
    id: id,
    date: date,
    customerId: customerId,
    notes: notes,
    status: status,
  );
}
