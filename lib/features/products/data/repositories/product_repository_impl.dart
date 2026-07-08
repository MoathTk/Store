import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource);

  @override
  Future<List<Product>> getAll() => _dataSource.getAll();

  @override
  Future<Product?> getById(int id) => _dataSource.getById(id);

  @override
  Future<Product> create({
    required String name,
    required int storeId,
    required int box,
    required int fill,
    required int currentState,
  }) =>
      _dataSource.create(
        name: name,
        storeId: storeId,
        box: box,
        fill: fill,
        currentState: currentState,
      );

  @override
  Future<Product> update({
    required int id,
    String? name,
    int? storeId,
    int? box,
    int? fill,
    int? currentState,
  }) =>
      _dataSource.update(
        id: id,
        name: name,
        storeId: storeId,
        box: box,
        fill: fill,
        currentState: currentState,
      );

  @override
  Future<void> delete(int id) => _dataSource.delete(id);
}
