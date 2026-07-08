import '../entities/order.dart';
import '../repositories/order_repository.dart';

class CreateOrderUseCase {
  final OrderRepository repository;

  const CreateOrderUseCase(this.repository);

  Future<Order> execute(CreateOrderParams params) => repository.create(params);
}
