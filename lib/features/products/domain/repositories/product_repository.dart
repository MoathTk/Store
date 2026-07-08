import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();
  Future<Product?> getById(int id);
  Future<Product> create({
    required String name,
    required int storeId,
    required int box,
    required int fill,
    required int currentState,
    required int price,
  });
  Future<Product> update({
    required int id,
    String? name,
    int? storeId,
    int? box,
    int? fill,
    int? currentState,
    int? price,
  });
  Future<void> delete(int id);
}
