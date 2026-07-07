class DatabaseConfig {
  DatabaseConfig._();

  static const String databaseName = 'store_management.db';
  static const int databaseVersion = 2;

  static const String tableStores = 'stores';

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
}
