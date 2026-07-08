import '../../../../core/database/database_config.dart';
import '../../../../core/database/database_helper.dart';
import '../models/product_model.dart';

class ProductLocalDataSource {
  final DatabaseHelper _db;

  ProductLocalDataSource(this._db);

  Future<List<ProductModel>> getAll() async {
    final rows = await _db.query(
      DatabaseConfig.tableProducts,
      orderBy: 'name ASC',
    );
    return rows.map((row) => ProductModel.fromMap(row)).toList();
  }

  Future<ProductModel?> getById(int id) async {
    final row = await _db.queryFirst(
      DatabaseConfig.tableProducts,
      where: 'id = ?',
      whereArgs: [id],
    );
    return row != null ? ProductModel.fromMap(row) : null;
  }

  Future<ProductModel> create({
    required String name,
    required int storeId,
    required int box,
    required int fill,
    required int currentState,
    required int price,
  }) async {
    final now = DateTime.now();
    final id = await _db.insert(
      DatabaseConfig.tableProducts,
      {
        'name': name,
        'storeId': storeId,
        'box': box,
        'fill': fill,
        'currentState': currentState,
        'price': price,
        'addedAt': now.toIso8601String(),
      },
    );
    return ProductModel.fromCreateParams(
      id: id,
      name: name,
      storeId: storeId,
      box: box,
      fill: fill,
      currentState: currentState,
      price: price,
      addedAt: now,
    );
  }

  Future<ProductModel> update({
    required int id,
    String? name,
    int? storeId,
    int? box,
    int? fill,
    int? currentState,
    int? price,
  }) async {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (storeId != null) map['storeId'] = storeId;
    if (box != null) map['box'] = box;
    if (fill != null) map['fill'] = fill;
    if (currentState != null) map['currentState'] = currentState;
    if (price != null) map['price'] = price;
    if (map.isNotEmpty) {
      await _db.update(DatabaseConfig.tableProducts, map, 'id = ?', [id]);
    }
    final updated = await getById(id);
    return updated!;
  }

  Future<void> delete(int id) async {
    await _db.delete(
      DatabaseConfig.tableProducts,
      'id = ?',
      [id],
    );
  }
}
