import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class CreateCustomerUseCase {
  final CustomerRepository repository;

  const CreateCustomerUseCase(this.repository);

  Future<Customer> execute({
    required String fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) =>
      repository.create(
        fullName: fullName,
        type: type,
        place: place,
        address: address,
        phone: phone,
        notes: notes,
      );
}
