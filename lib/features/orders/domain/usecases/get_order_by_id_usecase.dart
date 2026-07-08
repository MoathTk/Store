import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrderByIdUseCase {
  final OrderRepository repository;

  const GetOrderByIdUseCase(this.repository);

  Future<Order?> execute(int id) => repository.getById(id);
}
