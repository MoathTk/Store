import '../repositories/customer_repository.dart';

class DeleteCustomerUseCase {
  final CustomerRepository repository;

  const DeleteCustomerUseCase(this.repository);

  Future<void> execute(int id) => repository.delete(id);
}
