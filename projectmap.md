# store_management — Project Map

## Overview

A Flutter store management app with Clean Architecture, Material 3 theming, SQLite database, local-only authentication, and full Arabic/English localization with RTL support. Has auth flow (welcome → login/signup), a dashboard shell with sidebar navigation, stores feature with full CRUD and responsive grid UI, and customers feature with full CRUD and a premium data table UI. No other business features (products, inventory, sales) exist yet.

**Stack:** Flutter 3.x | Dart ^3.9.2 | Provider | Clean Architecture (feature-first)

---

## Architecture

```
lib/
├── main.dart                          # Entry point, MultiProvider setup, MaterialApp
├── core/                              # Shared infrastructure
│   ├── constants/app_constants.dart   # App-wide constants (durations, sizes)
│   ├── database/
│   │   ├── database_config.dart       # DB name, version, table creation SQL strings
│   │   └── database_helper.dart       # Singleton: lazy init, onCreate, generic CRUD
│   ├── providers/
│   │   ├── language_provider.dart     # Locale state (ChangeNotifier), toggle()
│   │   └── theme_provider.dart        # ThemeMode state (ChangeNotifier)
│   └── theme/
│       ├── app_colors.dart            # Static color palette (light + dark)
│       ├── app_gradients.dart         # ThemeExtension<AppGradients> for gradient support
│       └── app_theme.dart             # ThemeData builders (light/dark)
├── features/                          # Feature modules (Clean Architecture)
│   ├── auth/
│   │   ├── domain/                    # Innermost layer — no Flutter deps
│   │   │   ├── entities/user.dart         # User {id, username}
│   │   │   ├── repositories/auth_repository.dart  # Abstract repository interface
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart         # LoginUseCase.execute(username, pw)
│   │   │       └── sign_up_usecase.dart       # SignUpUseCase.execute(username, pw)
│   │   ├── data/                      # Implementation layer
│   │   │   ├── datasources/
│   │   │   │   ├── auth_local_datasource.dart   # FlutterSecureStorage wrapper
│   │   │   │   └── auth_remote_datasource.dart  # MockAuthDataSource (UNUSED)
│   │   │   ├── models/user_model.dart           # UserModel with fromJson/toJson
│   │   │   └── repositories/auth_repository_impl.dart  # Concrete implementation
│   │   └── presentation/              # UI layer
│   │       ├── providers/auth_provider.dart  # AuthProvider (ChangeNotifier)
│   │       ├── screens/
│   │       │   ├── welcome_screen.dart       # First-time onboarding
│   │       │   ├── login_screen.dart         # Login form
│   │       │   ├── sign_up_screen.dart       # Sign-up form
│   │       │   └── home_screen.dart          # Dead code (replaced by dashboard)
│   │       └── widgets/
│   │           ├── animated_logo.dart        # Scale/pulse logo animation
│   │           ├── auth_text_field.dart      # Reusable form field w/ icon + visibility toggle
│   │           ├── error_message.dart        # Conditional error text
│   │           ├── gradient_scaffold.dart    # Full-screen animated gradient scaffold
│   │           └── loading_button.dart       # ElevatedButton w/ spinner state
│   ├── dashboard/                     # Main app shell after login
│   │   └── presentation/
│   │       ├── providers/
│   │       │   └── navigation_provider.dart  # NavItem enum + active item state
│   │       ├── screens/
│   │       │   └── dashboard_screen.dart     # Row layout: [Sidebar | Content area]
│   │       └── widgets/
│   │           ├── sidebar.dart              # Full-height 250px sidebar with branding, nav, logout, theme toggle
│   │           └── sidebar_item.dart         # Single nav row (icon + label + active pill styling)
│   └── stores/                       # Store management (full CRUD + UI)
│       ├── domain/
│       │   ├── entities/store.dart         # Store {int id, String name, DateTime createdAt}
│       │   └── repositories/store_repository.dart  # Abstract CRUD interface
│       ├── data/
│       │   ├── datasources/store_local_datasource.dart  # SQLite CRUD via DatabaseHelper
│       │   ├── models/store_model.dart                   # StoreModel.toMap / fromMap
│       │   └── repositories/store_repository_impl.dart   # Concrete implementation
│       └── presentation/             # UI layer
│           ├── providers/store_provider.dart  # StoreStatus enum + CRUD state
│           ├── screens/stores_screen.dart     # AppBar + add dialog + StoreGrid
│           └── widgets/
│               ├── store_card.dart           # Tall gradient card (name, #id, date, delete)
│               ├── store_grid.dart           # State-aware grid (loading/error/empty/stores)
│               └── empty_stores.dart         # "No stores yet" illustration
│   └── customers/                    # Customer management (data table UI)
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── customer.dart            # Customer {id, fullName, type?, place?, address?, phone?, notes?, insertedAt}
│       │   │   └── customer_type.dart       # CustomerType enum (normal, provider, providerAndCustomer)
│       │   ├── repositories/customer_repository.dart  # Abstract CRUD interface
│       │   └── usecases/
│       │       ├── get_all_customers_usecase.dart
│       │       ├── get_customer_by_id_usecase.dart
│       │       ├── create_customer_usecase.dart
│       │       ├── update_customer_usecase.dart
│       │       └── delete_customer_usecase.dart
│       ├── data/
│       │   ├── datasources/customer_local_datasource.dart  # SQLite CRUD via DatabaseHelper
│       │   ├── models/customer_model.dart                  # CustomerModel.toMap / fromMap / fromCreateParams
│       │   └── repositories/customer_repository_impl.dart  # Concrete implementation
│       └── presentation/             # UI layer
│           ├── providers/customer_provider.dart   # CustomerStatus enum + pagination + sorting
│           ├── screens/customers_screen.dart      # Main screen with card container + table
│           └── widgets/
│               ├── customer_avatar.dart           # CircleAvatar with initials
│               ├── customer_type_badge.dart       # Colored chip for customer type
│               ├── customer_action_menu.dart      # Three-dot popup menu (edit/delete)
│               ├── customer_table_container.dart  # White card with shadow + border
│               ├── customer_table_header.dart     # Title row + Export/Add New buttons
│               ├── customer_data_table.dart       # Full DataTable with 8 columns + state handling
│               └── customer_table_pagination.dart # Previous/Next + page number boxes
├── l10n/                              # Localization source files (ARB)
│   ├── intl_en.arb                    # English strings
│   └── intl_ar.arb                    # Arabic strings
└── generated/l10n.dart              # Auto-generated S class delegates
```

---

## Data Flows

### Auth
```
UI (Screen/Widget)
  └─▶ AuthProvider (ChangeNotifier)
        └─▶ LoginUseCase / SignUpUseCase
              └─▶ AuthRepository (interface)
                    └─▶ AuthRepositoryImpl
                          ├─▶ AuthLocalDataSource (encrypted storage)
                          └─▶ (future) AuthRemoteDataSource (API)
```

### Database
```
App startup:
  sqfliteFfiInit() → databaseFactoryFfi → DatabaseHelper.instance.database → _onCreate() → stores table created

Every feature:
  UI → FeatureProvider
       └─▶ FeatureUseCase (if needed)
             └─▶ FeatureRepository (interface)
                   └─▶ FeatureRepositoryImpl
                         └─▶ FeatureLocalDataSource
                               └─▶ DatabaseHelper (singleton, generic CRUD)
                                     └─▶ sqflite Database
```

### Stores
```
StoresScreen → StoreProvider (ChangeNotifier)
                 └─▶ StoreRepository (interface)
                       └─▶ StoreRepositoryImpl
                             └─▶ StoreLocalDataSource
                                   └─▶ DatabaseHelper
                                         └─▶ stores table (id, name, createdAt)
```

### Customers
```
CustomersScreen → CustomerProvider (ChangeNotifier, pagination + sorting)
                   └─▶ GetAllCustomersUseCase / CreateCustomerUseCase / DeleteCustomerUseCase
                         └─▶ CustomerRepository (interface)
                               └─▶ CustomerRepositoryImpl
                                     └─▶ CustomerLocalDataSource
                                           └─▶ DatabaseHelper
                                                 └─▶ customers table (id, fullName, type, place, address, phone, notes, insertedAt)
```

---

## Navigation Flow

```
App Start
  ├─ First time? → WelcomeScreen
  │                  ├─ "Get Started" → SignUpScreen → (fade) → DashboardScreen
  │                  └─ "I have account" → LoginScreen → (fade) → DashboardScreen
  └─ Returning user → LoginScreen → (fade) → DashboardScreen
                         └─ Logout (sidebar) → LoginScreen
```

Dashboard internal nav (sidebar → content area):
```
Sidebar item tap → NavigationProvider.select(item)
                     → switch(activeItem):
                         NavItem.stores     → StoresScreen
                         NavItem.customer   → CustomersScreen (premium data table)
                         _                  → placeholder with navItemLabel(context, item)
```

Style: Manual `Navigator.pushReplacement` with `PageRouteBuilder` + `FadeTransition` (600ms).

---

## State Management

| Provider | Scope | Purpose |
|----------|-------|---------|
| `ThemeProvider` | Global | ThemeMode (dark/light), toggle |
| `LanguageProvider` | Global | Locale (en/ar), toggle, RTL support via MaterialApp |
| `AuthProvider` | Global | AuthStatus (idle/loading/success/failure), user, error |
| `NavigationProvider` | Global | Active NavItem (dashboard/order/product/...), select(), reset() |
| `StoreProvider` | Global | StoreStatus (idle/loading/success/failure), List<Store>, error, loadStores(), createStore(), deleteStore() |
| `CustomerProvider` | Global | CustomerStatus (idle/loading/success/failure), client-side pagination (10/page), sorting by id/fullName/place, CRUD via use cases |

All extend `ChangeNotifier`, consumed via `Provider.of` / `context.watch` / `context.read`.

---

## Dashboard Sidebar

The `Sidebar` widget is the primary navigation for the app (desktop-oriented, 250px fixed left panel):

```
┌──────────────────────┐
│  [store] My Store    │  ← Brand area (logo placeholder + brand name from S)
├──────────────────────┤
│  📊 Dashboard        │
│  🏪 Stores           │
│  🛒 Order            │
│  📦 Product          │  ← Active: primary bg, onPrimary text, 12px pill radius
│  👥 Customer         │
│  🏅 Employee         │
│  📋 Billing          │
│  📈 Analytics        │
│  ⚙️ Setting     ▶   │  ← hasDropdown: chevron icon
│  ❓ Help             │
├──────────────────────┤
│  🚪 Log out          │  ← calls AuthProvider.reset() → navigate to LoginScreen
├──────────────────────┤
│  🌙 Dark Mode        │  ← theme toggle via ThemeProvider
│  🌐 العربية/English  │  ← language toggle via LanguageProvider
└──────────────────────┘
```

- **All colors are theme-aware** — uses `colorScheme.surface`, `.primary`, `.onPrimary`, `.onSurface`
- Active item uses `Material + InkWell` with `BorderRadius.circular(12)` pill effect
- Nav items defined as `NavItem` enum with icon, hasDropdown metadata; `label` getter removed, labels provided by `navItemLabel(BuildContext, NavItem)` helper using `S.of(context)`
- Logout, theme toggle, and language toggle are built into the sidebar bottom area

---

## Stores Feature

The `StoresScreen` is shown when `NavItem.stores` is selected in the sidebar.

### StoreProvider (ChangeNotifier)

```
StoreStatus: idle → loading → success | failure
```

| Method | Effect |
|--------|--------|
| `loadStores()` | Fetches all stores from DB, sets status |
| `createStore(name)` | Inserts row, reloads list |
| `deleteStore(id)` | Deletes row, reloads list |

### StoreCard Design

```
┌─────────────────────┐
│  [🏪]        [🗑️]    │  ← gradient bg (cardGradient)
│                     │
│  Store Name         │  ← 18px bold, onPrimary
│                     │
│  #1                 │  ← 13px, onPrimary(0.7)
│  Jul 7, 2026        │  ← 12px, onPrimary(0.5)
└─────────────────────┘
```

- **Background**: `Theme.of(context).extension<AppGradients>()!.cardGradient`
- **Shape**: `BorderRadius.circular(16)`, `Material + InkWell`
- **Aspect**: `childAspectRatio: 0.75` (tall), responsive grid (auto-calc columns from width)

### State Handling

| StoreStatus | UI |
|-------------|-----|
| `idle` / `loading` | Centered `CircularProgressIndicator` |
| `success` (empty) | `EmptyStores` widget (icon + "No stores yet" + subtext) |
| `success` (has data) | Responsive `GridView` of `StoreCard` widgets |
| `failure` | Error icon + message in `colors.error` |

### Add Store Dialog

Simple `AlertDialog` with `TextField` for name + "Create"/"Cancel" buttons. Calls `StoreProvider.createStore()` on submit.

### Delete Store

Delete `IconButton` on each `StoreCard` → confirmation dialog → `StoreProvider.deleteStore()`.

---

## Theming

- **Material 3** with `ColorScheme.fromSeed(seedColor: AppColors.primary)`
- Custom `ThemeExtension<AppGradients>` for background/card gradients (used by `GradientScaffold`)
- Dark mode default, toggle via `ThemeProvider.toggle()`
- Consistent input/button themes defined in `AppTheme`

## Localization

- **Framework**: `intl` + `flutter_localization` with auto-generated `S` class
- **Languages**: English (`intl_en.arb`) and Arabic (`intl_ar.arb`)
- **RTL**: Arabic locale uses RTL layout automatically via MaterialApp's `locale` / `supportedLocales`
- **Usage**: All UI strings use `S.of(context).key` — no hardcoded text remains in UI code
- **Toggle**: Language toggle button in sidebar (bottom area, below theme toggle) calls `LanguageProvider.toggle()`
- **State**: `LanguageProvider` (ChangeNotifier) holds the current `Locale` and provides `toggle()` to switch between `Locale('en')` and `Locale('ar')`
- **Date formatting**: `DateFormat.yMd()` uses `Localizations.localeOf(context)` for locale-aware date display

---

## Database Layer

### DatabaseHelper (Singleton)

```dart
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }
}
```

- **Initialized at startup** — `main.dart` calls `sqfliteFfiInit()`, sets `databaseFactory = databaseFactoryFfi`, then `await DatabaseHelper.instance.database`
- **Generic CRUD** — `insert()`, `query()`, `queryFirst()`, `update()`, `delete()` — any feature can use these
- **Schema in DatabaseConfig** — table creation SQL strings live in `DatabaseConfig`, version-controlled alongside `databaseVersion`

### Adding a New Table

1. Add `static const String tableX = 'x'` to `DatabaseConfig`
2. Add `static String get createXTable => 'CREATE TABLE ...'`
3. Increment `DatabaseConfig.databaseVersion`
4. Add `onUpgrade` callback in `DatabaseHelper` with `await db.execute(...)` for migration
5. Create entity → model → datasource → repository in the new feature's folder

### stores Table Schema

```sql
CREATE TABLE stores (
  id        INTEGER PRIMARY KEY AUTOINCREMENT,
  name      TEXT    NOT NULL,
  createdAt TEXT    NOT NULL
);
```

### customers Table Schema

```sql
CREATE TABLE customers (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName   TEXT    NOT NULL,
  type       TEXT    NULL,
  place      TEXT    NULL,
  address    TEXT    NULL,
  phone      TEXT    NULL,
  notes      TEXT    NULL,
  insertedAt TEXT    NOT NULL
);
```

`type` stores one of: `'normal'`, `'provider'`, `'provider_and_customer'` — mapped to/from `CustomerType` enum.

### Migration History

| From | To | SQL |
|------|----|-----|
| 1 | 2 | `ALTER TABLE stores ADD COLUMN createdAt TEXT NOT NULL DEFAULT ''` |
| 2 | 3 | `CREATE TABLE customers (...)` |

---

## Known Issues / TODOs

1. **Dependency re-creation** (`main.dart:29-32`): `AuthLocalDataSource`, `AuthRepositoryImpl`, and use cases are re-created on every `MyApp.build()`. Should be hoisted or injected.
2. **Dead code**: `MockAuthDataSource` (`auth_remote_datasource.dart`) is never wired into the repository. `HomeScreen` (`auth/presentation/screens/home_screen.dart`) is no longer navigated to.
3. **Commented-out debug code** (`auth_local_datasource.dart:9-10`): Leftover `delete` calls.
4. **No error handling** on `hasCredentials()` in `main.dart:18`.
5. **Test coverage**: Only 1 smoke test. Missing unit tests for providers, use cases, and repositories.
6. **No other business features**: Products, inventory, orders, employees, billing, analytics — none exist yet. Only `stores` and `customers` have full UIs.

---

## Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `provider` | ^6.1.2 | State management |
| `flutter_secure_storage` | ^9.2.4 | Encrypted credential storage |
| `flutter_localization` | ^0.4.1 | Localization framework |
| `intl` | ^0.20.2 | Date formatting, i18n |
| `sqflite` | ^2.4.1 | SQLite database (Android/iOS) |
| `sqflite_common_ffi` | ^2.3.4 | SQLite via FFI (Windows, macOS, Linux) |
| `path` | ^1.9.0 | Path utilities for DB file location |
| `path_provider` | ^2.1.5 | Platform-specific directories |
| `cupertino_icons` | ^1.0.8 | iOS-style icon set |
| `flutter_lints` | ^5.0.0 | Lint rules (dev) |

---

## Testing

- Framework: `flutter_test` (SDK)
- Current: 1 widget test (`test/widget_test.dart`) — verifies `MyApp` builds without errors
- No unit tests for: `AuthProvider`, `AuthRepositoryImpl`, `LoginUseCase`, `SignUpUseCase`, `ThemeProvider`

---

## Conventions

- **File naming**: `snake_case.dart`
- **Class naming**: `PascalCase`
- **Private members**: `_prefix`
- **Imports**: Relative (e.g. `../../../../core/...`)
- **Packages**: Use `package:` imports for external packages
- **No comments in code** unless necessary for complex logic
- **No emojis** in UI or code

---

## Platform Support

All platforms enabled: Android, iOS, Windows, macOS, Linux, Web.

---

## main.dart Initialization

The app entry point (`main.dart`) sets up:
1. `sqfliteFfiInit()` + `databaseFactoryFfi` for desktop SQLite
2. `WidgetsFlutterBinding.ensureInitialized()`
3. `LanguageProvider` — checks saved locale from `SharedPreferences`
4. `MultiProvider` wrapping `MyApp` with: `LanguageProvider` → `ThemeProvider` → `AuthProvider` → `NavigationProvider` → `StoreProvider`
5. `MaterialApp` configured with:
   - `locale: context.watch<LanguageProvider>().locale`
   - `supportedLocales: [Locale('en'), Locale('ar')]`
   - `localizationsDelegates: [S.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate]`
   - `title: S.of(context).appTitle`

---

## Getting Started

```bash
flutter pub get
flutter run          # runs on default device
flutter test         # runs widget test
flutter build apk    # builds Android release
```
