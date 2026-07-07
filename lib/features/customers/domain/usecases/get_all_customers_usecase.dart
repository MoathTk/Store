import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class GetAllCustomersUseCase {
  final CustomerRepository repository;

  const GetAllCustomersUseCase(this.repository);

  Future<List<Customer>> execute() => repository.getAll();
}
