import '../repositories/order_repository.dart';

class DeleteOrderUseCase {
  final OrderRepository repository;

  const DeleteOrderUseCase(this.repository);

  Future<void> execute(int id) => repository.delete(id);
}
