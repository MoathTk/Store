import '../../../../core/database/database_config.dart';
import '../../../../core/database/database_helper.dart';
import '../models/customer_model.dart';

class CustomerLocalDataSource {
  final DatabaseHelper _db;

  CustomerLocalDataSource(this._db);

  Future<List<CustomerModel>> getAll() async {
    final rows = await _db.query(
      DatabaseConfig.tableCustomers,
      orderBy: 'fullName ASC',
    );
    return rows.map((row) => CustomerModel.fromMap(row)).toList();
  }

  Future<CustomerModel?> getById(int id) async {
    final row = await _db.queryFirst(
      DatabaseConfig.tableCustomers,
      where: 'id = ?',
      whereArgs: [id],
    );
    return row != null ? CustomerModel.fromMap(row) : null;
  }

  Future<CustomerModel> create({
    required String fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) async {
    final now = DateTime.now();
    final id = await _db.insert(
      DatabaseConfig.tableCustomers,
      {
        'fullName': fullName,
        'type': type,
        'place': place,
        'address': address,
        'phone': phone,
        'notes': notes,
        'insertedAt': now.toIso8601String(),
      },
    );
    return CustomerModel.fromCreateParams(
      id: id,
      fullName: fullName,
      type: type,
      place: place,
      address: address,
      phone: phone,
      notes: notes,
      insertedAt: now,
    );
  }

  Future<CustomerModel> update({
    required int id,
    String? fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) async {
    final map = <String, dynamic>{};
    if (fullName != null) map['fullName'] = fullName;
    if (type != null) map['type'] = type;
    if (place != null) map['place'] = place;
    if (address != null) map['address'] = address;
    if (phone != null) map['phone'] = phone;
    if (notes != null) map['notes'] = notes;
    if (map.isNotEmpty) {
      await _db.update(DatabaseConfig.tableCustomers, map, 'id = ?', [id]);
    }
    final updated = await getById(id);
    return updated!;
  }

  Future<void> delete(int id) async {
    await _db.delete(
      DatabaseConfig.tableCustomers,
      'id = ?',
      [id],
    );
  }
}
