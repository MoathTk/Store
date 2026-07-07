import '../../domain/entities/customer.dart';
import '../../domain/repositories/customer_repository.dart';
import '../datasources/customer_local_datasource.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerLocalDataSource _dataSource;

  CustomerRepositoryImpl(this._dataSource);

  @override
  Future<List<Customer>> getAll() => _dataSource.getAll();

  @override
  Future<Customer?> getById(int id) => _dataSource.getById(id);

  @override
  Future<Customer> create({
    required String fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) =>
      _dataSource.create(
        fullName: fullName,
        type: type,
        place: place,
        address: address,
        phone: phone,
        notes: notes,
      );

  @override
  Future<Customer> update({
    required int id,
    String? fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) =>
      _dataSource.update(
        id: id,
        fullName: fullName,
        type: type,
        place: place,
        address: address,
        phone: phone,
        notes: notes,
      );

  @override
  Future<void> delete(int id) => _dataSource.delete(id);
}
