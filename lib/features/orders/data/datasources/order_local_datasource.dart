import '../../../../core/database/database_config.dart';
import '../../../../core/database/database_helper.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/repositories/order_repository.dart';
import '../models/order_item_model.dart';
import '../models/order_model.dart';

class OrderLocalDataSource {
  final DatabaseHelper _db;

  OrderLocalDataSource(this._db);

  Future<List<Order>> getAll() async {
    final orderRows = await _db.query(
      DatabaseConfig.tableOrders,
      orderBy: 'id DESC',
    );
    final orders = <Order>[];
    for (final row in orderRows) {
      final id = row['id'] as int;
      final items = await _getItemsForOrder(id);
      orders.add(OrderModel.fromMap(row, items: items));
    }
    return orders;
  }

  Future<Order?> getById(int id) async {
    final row = await _db.queryFirst(
      DatabaseConfig.tableOrders,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (row == null) return null;
    final items = await _getItemsForOrder(id);
    return OrderModel.fromMap(row, items: items);
  }

  Future<Order> create(CreateOrderParams params) async {
    final orderId = await _db.transaction<int>((txn) async {
      final oid = await txn.insert(DatabaseConfig.tableOrders, {
        'date': params.date.toIso8601String(),
        'customerId': params.customerId,
        'notes': params.notes,
        'status': params.status.value,
      });
      for (final item in params.items) {
        await txn.insert(DatabaseConfig.tableOrderItems, {
          'orderId': oid,
          'itemId': item.itemId,
          'storeId': item.storeId,
          'boxes': item.boxes,
          'fill': item.fill,
          'price': item.price,
        });
        final productRow = await txn.query(
          DatabaseConfig.tableProducts,
          columns: ['box', 'currentState'],
          where: 'id = ?',
          whereArgs: [item.itemId],
        );
        if (productRow.isNotEmpty) {
          final currentState = productRow.first['currentState'] as int;
          final box = productRow.first['box'] as int;
          await txn.update(
            DatabaseConfig.tableProducts,
            {
              'box': box - item.boxes,
              'currentState': currentState - item.boxes * item.fill,
            },
            where: 'id = ?',
            whereArgs: [item.itemId],
          );
        }
      }
      return oid;
    });
    return (await getById(orderId))!;
  }

  Future<Order> update({
    required int id,
    DateTime? date,
    int? customerId,
    String? notes,
    OrderStatus? status,
  }) async {
    final map = <String, dynamic>{};
    if (date != null) map['date'] = date.toIso8601String();
    if (customerId != null) map['customerId'] = customerId;
    if (notes != null) map['notes'] = notes;
    if (status != null) map['status'] = status.value;
    if (map.isNotEmpty) {
      await _db.update(DatabaseConfig.tableOrders, map, 'id = ?', [id]);
    }
    return (await getById(id))!;
  }

  Future<void> delete(int id) async {
    await _db.transaction<void>((txn) async {
      final itemRows = await txn.query(
        DatabaseConfig.tableOrderItems,
        where: 'orderId = ?',
        whereArgs: [id],
      );
      for (final row in itemRows) {
        if ((row['isPaid'] as int?) == 0) {
          final productRow = await txn.query(
            DatabaseConfig.tableProducts,
            columns: ['box', 'currentState'],
            where: 'id = ?',
            whereArgs: [row['itemId']],
          );
          if (productRow.isNotEmpty) {
            final currentState = productRow.first['currentState'] as int;
            final box = productRow.first['box'] as int;
            await txn.update(
              DatabaseConfig.tableProducts,
              {
                'box': box + (row['boxes'] as int),
                'currentState':
                    currentState + (row['boxes'] as int) * (row['fill'] as int),
              },
              where: 'id = ?',
              whereArgs: [row['itemId']],
            );
          }
        }
      }
      await txn.delete(
        DatabaseConfig.tableOrderItems,
        where: 'orderId = ?',
        whereArgs: [id],
      );
      await txn.delete(
        DatabaseConfig.tableOrders,
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  Future<Order> markItemPaid(int orderItemId) async {
    final item = await _db.queryFirst(
      DatabaseConfig.tableOrderItems,
      where: 'id = ?',
      whereArgs: [orderItemId],
    );
    if (item == null) throw Exception('Order item not found');
    final orderId = item['orderId'] as int;
    await _db.update(
      DatabaseConfig.tableOrderItems,
      {'isPaid': 1, 'paidAt': DateTime.now().toIso8601String()},
      'id = ?',
      [orderItemId],
    );
    final allItems = await _db.query(
      DatabaseConfig.tableOrderItems,
      where: 'orderId = ?',
      whereArgs: [orderId],
    );
    if (allItems.every((row) => (row['isPaid'] as int) == 1)) {
      await _db.update(
        DatabaseConfig.tableOrders,
        {'status': 'done'},
        'id = ?',
        [orderId],
      );
    }
    return (await getById(orderId))!;
  }

  Future<List<OrderItem>> _getItemsForOrder(int orderId) async {
    final rows = await _db.query(
      DatabaseConfig.tableOrderItems,
      where: 'orderId = ?',
      whereArgs: [orderId],
    );
    return rows.map((row) => OrderItemModel.fromMap(row)).toList();
  }
}
