import 'package:flutter/foundation.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../../domain/usecases/create_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';

enum ProductStatus { idle, loading, success, failure }

enum ProductSortField { id, name, storeId, currentState }

class ProductProvider extends ChangeNotifier {
  final GetAllProductsUseCase _getAllUseCase;
  final CreateProductUseCase _createUseCase;
  final UpdateProductUseCase _updateUseCase;
  final DeleteProductUseCase _deleteUseCase;

  ProductProvider(
    this._getAllUseCase,
    this._createUseCase,
    this._updateUseCase,
    this._deleteUseCase,
  );

  ProductStatus _status = ProductStatus.idle;
  List<Product> _allProducts = [];
  String? _error;
  int _currentPage = 1;
  static const int _pageSize = 10;
  ProductSortField _sortField = ProductSortField.name;
  bool _sortAscending = true;
  String _searchQuery = '';
  int? _storeFilter;

  ProductStatus get status => _status;
  List<Product> get allProducts => _allProducts;
  String? get error => _error;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  String get searchQuery => _searchQuery;
  int? get storeFilter => _storeFilter;

  List<Product> get _filtered {
    var result = _allProducts;
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      result = result.where((p) {
        return p.name.toLowerCase().contains(q) || p.id.toString().contains(q);
      }).toList();
    }
    if (_storeFilter != null) {
      result = result.where((p) => p.storeId == _storeFilter).toList();
    }
    return result;
  }

  int get totalPages => (_filtered.length / _pageSize).ceil().clamp(1, 999);
  ProductSortField get sortField => _sortField;
  bool get sortAscending => _sortAscending;

  List<Product> get paginatedProducts {
    final sorted = List<Product>.from(_filtered);
    sorted.sort((a, b) {
      int cmp;
      switch (_sortField) {
        case ProductSortField.id:
          cmp = a.id.compareTo(b.id);
        case ProductSortField.name:
          cmp = a.name.compareTo(b.name);
        case ProductSortField.storeId:
          cmp = a.storeId.compareTo(b.storeId);
        case ProductSortField.currentState:
          cmp = a.currentState.compareTo(b.currentState);
      }
      return _sortAscending ? cmp : -cmp;
    });
    final start = (_currentPage - 1) * _pageSize;
    return sorted.skip(start).take(_pageSize).toList();
  }

  Future<void> loadProducts() async {
    _status = ProductStatus.loading;
    _error = null;
    notifyListeners();

    try {
      _allProducts = await _getAllUseCase.execute();
      _status = ProductStatus.success;
      _currentPage = 1;
    } catch (e) {
      _error = e.toString();
      _status = ProductStatus.failure;
    }
    notifyListeners();
  }

  Future<void> createProduct({
    required String name,
    required int storeId,
    required int box,
    required int fill,
    required int currentState,
    required int price,
  }) async {
    _status = ProductStatus.loading;
    _error = null;
    notifyListeners();

    try {
      await _createUseCase.execute(
        name: name,
        storeId: storeId,
        box: box,
        fill: fill,
        currentState: currentState,
        price: price,
      );
      await loadProducts();
    } catch (e) {
      _error = e.toString();
      _status = ProductStatus.failure;
      notifyListeners();
    }
  }

  Future<void> updateProduct({
    required int id,
    String? name,
    int? storeId,
    int? box,
    int? fill,
    int? currentState,
    int? price,
  }) async {
    _status = ProductStatus.loading;
    _error = null;
    notifyListeners();

    try {
      await _updateUseCase.execute(
        id: id,
        name: name,
        storeId: storeId,
        box: box,
        fill: fill,
        currentState: currentState,
        price: price,
      );
      await loadProducts();
    } catch (e) {
      _error = e.toString();
      _status = ProductStatus.failure;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _deleteUseCase.execute(id);
      await loadProducts();
    } catch (e) {
      _error = e.toString();
      _status = ProductStatus.failure;
      notifyListeners();
    }
  }

  void goToPage(int page) {
    if (page < 1 || page > totalPages) return;
    _currentPage = page;
    notifyListeners();
  }

  void toggleSort(ProductSortField field) {
    if (_sortField == field) {
      _sortAscending = !_sortAscending;
    } else {
      _sortField = field;
      _sortAscending = true;
    }
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query;
    _currentPage = 1;
    notifyListeners();
  }

  void filterByStore(int storeId) {
    _storeFilter = _storeFilter == storeId ? null : storeId;
    _currentPage = 1;
    notifyListeners();
  }

  void clearStoreFilter() {
    _storeFilter = null;
    _currentPage = 1;
    notifyListeners();
  }
}
