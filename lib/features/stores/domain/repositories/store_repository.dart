import '../entities/store.dart';

abstract class StoreRepository {
  Future<List<Store>> getAll();
  Future<Store?> getById(int id);
  Future<Store> create(String name);
  Future<Store> update(int id, String name);
  Future<void> delete(int id);
}
