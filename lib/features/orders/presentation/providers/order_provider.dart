import 'package:flutter/foundation.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/usecases/get_all_orders_usecase.dart';
import '../../domain/usecases/create_order_usecase.dart';
import '../../domain/usecases/update_order_usecase.dart';
import '../../domain/usecases/delete_order_usecase.dart';
import '../../domain/usecases/mark_order_item_paid_usecase.dart';
import '../../domain/repositories/order_repository.dart';

enum OrderLoadStatus { idle, loading, success, failure }

class OrderProvider extends ChangeNotifier {
  final GetAllOrdersUseCase _getAllUseCase;
  final CreateOrderUseCase _createUseCase;
  final UpdateOrderUseCase _updateUseCase;
  final DeleteOrderUseCase _deleteUseCase;
  final MarkOrderItemPaidUseCase _markItemPaidUseCase;

  OrderProvider(
    this._getAllUseCase,
    this._createUseCase,
    this._updateUseCase,
    this._deleteUseCase,
    this._markItemPaidUseCase,
  );

  OrderLoadStatus _status = OrderLoadStatus.idle;
  List<Order> _allOrders = [];
  String? _error;
  int _currentPage = 1;
  static const int _pageSize = 20;
  String _searchQuery = '';
  OrderStatus? _statusFilter;
  Map<int, String> customerNames = {};

  OrderLoadStatus get status => _status;
  List<Order> get allOrders => _allOrders;
  String? get error => _error;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  String get searchQuery => _searchQuery;
  OrderStatus? get statusFilter => _statusFilter;

  List<Order> get _filtered {
    var result = _allOrders;
    if (_statusFilter != null) {
      result = result.where((o) => o.status == _statusFilter).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      result = result.where((o) {
        if (o.id.toString().contains(q)) return true;
        if (o.customerId.toString().contains(q)) return true;
        final name = customerNames[o.customerId]?.toLowerCase() ?? '';
        if (name.contains(q)) return true;
        return false;
      }).toList();
    }
    return result;
  }

  int get totalPages =>
      (_filtered.length / _pageSize).ceil().clamp(1, 999);

  List<Order> get paginatedOrders {
    final sorted = List<Order>.from(_filtered);
    sorted.sort((a, b) => b.date.compareTo(a.date));
    final start = (_currentPage - 1) * _pageSize;
    return sorted.skip(start).take(_pageSize).toList();
  }

  void updateCustomerNames(Map<int, String> names) {
    customerNames = names;
    notifyListeners();
  }

  Future<void> loadOrders() async {
    _status = OrderLoadStatus.loading;
    _error = null;
    notifyListeners();
    try {
      _allOrders = await _getAllUseCase.execute();
      _status = OrderLoadStatus.success;
      _currentPage = 1;
    } catch (e) {
      _error = e.toString();
      _status = OrderLoadStatus.failure;
    }
    notifyListeners();
  }

  Future<void> createOrder(CreateOrderParams params) async {
    _status = OrderLoadStatus.loading;
    _error = null;
    notifyListeners();
    try {
      await _createUseCase.execute(params);
      await loadOrders();
    } catch (e) {
      _error = e.toString();
      _status = OrderLoadStatus.failure;
      notifyListeners();
    }
  }

  Future<void> updateOrder({
    required int id,
    DateTime? date,
    int? customerId,
    String? notes,
    OrderStatus? status,
  }) async {
    _status = OrderLoadStatus.loading;
    _error = null;
    notifyListeners();
    try {
      await _updateUseCase.execute(
        id: id,
        date: date,
        customerId: customerId,
        notes: notes,
        status: status,
      );
      await loadOrders();
    } catch (e) {
      _error = e.toString();
      _status = OrderLoadStatus.failure;
      notifyListeners();
    }
  }

  Future<void> markItemPaid(int orderItemId) async {
    try {
      await _markItemPaidUseCase.execute(orderItemId);
      await loadOrders();
    } catch (e) {
      _error = e.toString();
      _status = OrderLoadStatus.failure;
      notifyListeners();
    }
  }

  Future<void> deleteOrder(int id) async {
    try {
      await _deleteUseCase.execute(id);
      await loadOrders();
    } catch (e) {
      _error = e.toString();
      _status = OrderLoadStatus.failure;
      notifyListeners();
    }
  }

  void goToPage(int page) {
    if (page < 1 || page > totalPages) return;
    _currentPage = page;
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query;
    _currentPage = 1;
    notifyListeners();
  }

  void filterByStatus(OrderStatus? status) {
    _statusFilter = _statusFilter == status ? null : status;
    _currentPage = 1;
    notifyListeners();
  }
}
