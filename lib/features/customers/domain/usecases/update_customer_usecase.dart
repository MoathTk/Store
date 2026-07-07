import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class UpdateCustomerUseCase {
  final CustomerRepository repository;

  const UpdateCustomerUseCase(this.repository);

  Future<Customer> execute({
    required int id,
    String? fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) =>
      repository.update(
        id: id,
        fullName: fullName,
        type: type,
        place: place,
        address: address,
        phone: phone,
        notes: notes,
      );
}
