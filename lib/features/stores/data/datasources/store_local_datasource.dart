import '../../../../core/database/database_config.dart';
import '../../../../core/database/database_helper.dart';
import '../models/store_model.dart';

class StoreLocalDataSource {
  final DatabaseHelper _db;

  StoreLocalDataSource(this._db);

  Future<List<StoreModel>> getAll() async {
    final rows = await _db.query(
      DatabaseConfig.tableStores,
      orderBy: 'name ASC',
    );
    return rows.map((row) => StoreModel.fromMap(row)).toList();
  }

  Future<StoreModel?> getById(int id) async {
    final row = await _db.queryFirst(
      DatabaseConfig.tableStores,
      where: 'id = ?',
      whereArgs: [id],
    );
    return row != null ? StoreModel.fromMap(row) : null;
  }

  Future<StoreModel> create(String name) async {
    final now = DateTime.now().toIso8601String();
    final id = await _db.insert(
      DatabaseConfig.tableStores,
      {'name': name, 'createdAt': now},
    );
    return StoreModel(id: id, name: name, createdAt: DateTime.parse(now));
  }

  Future<StoreModel> update(int id, String name) async {
    await _db.update(
      DatabaseConfig.tableStores,
      {'name': name},
      'id = ?',
      [id],
    );
    final updated = await getById(id);
    return updated!;
  }

  Future<void> delete(int id) async {
    await _db.delete(
      DatabaseConfig.tableStores,
      'id = ?',
      [id],
    );
  }
}
