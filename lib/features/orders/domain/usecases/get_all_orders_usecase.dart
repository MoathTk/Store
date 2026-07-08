import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetAllOrdersUseCase {
  final OrderRepository repository;

  const GetAllOrdersUseCase(this.repository);

  Future<List<Order>> execute() => repository.getAll();
}
