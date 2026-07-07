import '../entities/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAll();
  Future<Customer?> getById(int id);
  Future<Customer> create({
    required String fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  });
  Future<Customer> update({
    required int id,
    String? fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  });
  Future<void> delete(int id);
}
