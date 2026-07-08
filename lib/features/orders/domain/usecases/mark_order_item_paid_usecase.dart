import '../entities/order.dart';
import '../repositories/order_repository.dart';

class MarkOrderItemPaidUseCase {
  final OrderRepository repository;
  const MarkOrderItemPaidUseCase(this.repository);

  Future<Order> execute(int orderItemId) =>
      repository.markItemPaid(orderItemId);
}
