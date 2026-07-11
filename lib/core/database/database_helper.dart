import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_config.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }

  Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DatabaseConfig.databaseName);
    return openDatabase(
      path,
      version: DatabaseConfig.databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DatabaseConfig.createStoresTable);
    await db.execute(DatabaseConfig.createCustomersTable);
    await db.execute(DatabaseConfig.createProductsTable);
    await db.execute(DatabaseConfig.createOrdersTable);
    await db.execute(DatabaseConfig.createOrderItemsTable);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(DatabaseConfig.addCreatedAtColumn);
    }
    if (oldVersion < 3) {
      await db.execute(DatabaseConfig.createCustomersTable);
    }
    if (oldVersion < 4) {
      await db.execute(DatabaseConfig.createProductsTable);
    }
    if (oldVersion < 5) {
      await db.execute(DatabaseConfig.createOrdersTable);
      await db.execute(DatabaseConfig.createOrderItemsTable);
    }
    if (oldVersion < 6) {
      await db.execute(
        'ALTER TABLE ${DatabaseConfig.tableOrderItems} ADD COLUMN price INTEGER NOT NULL DEFAULT 0',
      );
    }
    if (oldVersion < 7) {
      await db.execute(
        'ALTER TABLE ${DatabaseConfig.tableProducts} ADD COLUMN price INTEGER NOT NULL DEFAULT 0',
      );
    }
    if (oldVersion < 8) {
      await db.execute(
        'ALTER TABLE ${DatabaseConfig.tableOrderItems} ADD COLUMN isPaid INTEGER NOT NULL DEFAULT 0',
      );
    }
    if (oldVersion < 9) {
      await db.execute(
        'ALTER TABLE ${DatabaseConfig.tableOrderItems} ADD COLUMN paidAt TEXT NULL',
      );
    }
  }

  Future<int> insert(String table, Map<String, dynamic> values) async {
    final db = await database;
    return db.insert(table, values);
  }

  Future<List<Map<String, dynamic>>> query(
    String table, {
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    final db = await database;
    return db.query(table, where: where, whereArgs: whereArgs, orderBy: orderBy);
  }

  Future<Map<String, dynamic>?> queryFirst(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final rows = await query(table, where: where, whereArgs: whereArgs);
    return rows.isNotEmpty ? rows.first : null;
  }

  Future<int> update(
    String table,
    Map<String, dynamic> values,
    String where,
    List<Object?>? whereArgs,
  ) async {
    final db = await database;
    return db.update(table, values, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(
    String table,
    String where,
    List<Object?>? whereArgs,
  ) async {
    final db = await database;
    return db.delete(table, where: where, whereArgs: whereArgs);
  }

  Future<T> transaction<T>(Future<T> Function(Transaction txn) callback) async {
    final db = await database;
    return db.transaction(callback);
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
