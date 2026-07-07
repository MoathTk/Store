import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class GetCustomerByIdUseCase {
  final CustomerRepository repository;

  const GetCustomerByIdUseCase(this.repository);

  Future<Customer?> execute(int id) => repository.getById(id);
}
