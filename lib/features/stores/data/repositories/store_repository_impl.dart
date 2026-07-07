import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';
import '../datasources/store_local_datasource.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreLocalDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> getAll() => _dataSource.getAll();

  @override
  Future<Store?> getById(int id) => _dataSource.getById(id);

  @override
  Future<Store> create(String name) => _dataSource.create(name);

  @override
  Future<Store> update(int id, String name) => _dataSource.update(id, name);

  @override
  Future<void> delete(int id) => _dataSource.delete(id);
}
