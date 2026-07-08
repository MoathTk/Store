class DatabaseConfig {
  DatabaseConfig._();

  static const String databaseName = 'store_management.db';
  static const int databaseVersion = 4;

  static const String tableStores = 'stores';
  static const String tableCustomers = 'customers';
  static const String tableProducts = 'products';

  static String get createStoresTable => '''
    CREATE TABLE $tableStores (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      createdAt TEXT NOT NULL
    )
  ''';

  static String get addCreatedAtColumn => '''
    ALTER TABLE $tableStores ADD COLUMN createdAt TEXT NOT NULL DEFAULT ''
  ''';

  static String get createCustomersTable => '''
    CREATE TABLE $tableCustomers (
      id         INTEGER PRIMARY KEY AUTOINCREMENT,
      fullName   TEXT    NOT NULL,
      type       TEXT    NULL,
      place      TEXT    NULL,
      address    TEXT    NULL,
      phone      TEXT    NULL,
      notes      TEXT    NULL,
      insertedAt TEXT    NOT NULL
    )
  ''';

  static String get createProductsTable => '''
    CREATE TABLE $tableProducts (
      id           INTEGER PRIMARY KEY AUTOINCREMENT,
      name         TEXT    NOT NULL,
      storeId      INTEGER NOT NULL,
      box          INTEGER NOT NULL,
      fill         INTEGER NOT NULL,
      currentState INTEGER NOT NULL,
      addedAt      TEXT    NOT NULL
    )
  ''';
}
