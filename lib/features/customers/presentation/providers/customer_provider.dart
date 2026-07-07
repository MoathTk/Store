import 'package:flutter/foundation.dart';
import '../../domain/entities/customer.dart';
import '../../domain/usecases/get_all_customers_usecase.dart';
import '../../domain/usecases/create_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';

enum CustomerStatus { idle, loading, success, failure }

enum CustomerSortField { id, fullName, place }

class CustomerProvider extends ChangeNotifier {
  final GetAllCustomersUseCase _getAllUseCase;
  final CreateCustomerUseCase _createUseCase;
  final DeleteCustomerUseCase _deleteUseCase;

  CustomerProvider(this._getAllUseCase, this._createUseCase, this._deleteUseCase);

  CustomerStatus _status = CustomerStatus.idle;
  List<Customer> _allCustomers = [];
  String? _error;
  int _currentPage = 1;
  static const int _pageSize = 10;
  CustomerSortField _sortField = CustomerSortField.fullName;
  bool _sortAscending = true;

  CustomerStatus get status => _status;
  List<Customer> get allCustomers => _allCustomers;
  String? get error => _error;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  int get totalPages => (_allCustomers.length / _pageSize).ceil().clamp(1, 999);
  CustomerSortField get sortField => _sortField;
  bool get sortAscending => _sortAscending;

  List<Customer> get paginatedCustomers {
    final sorted = List<Customer>.from(_allCustomers);
    sorted.sort((a, b) {
      int cmp;
      switch (_sortField) {
        case CustomerSortField.id:
          cmp = a.id.compareTo(b.id);
        case CustomerSortField.fullName:
          cmp = a.fullName.compareTo(b.fullName);
        case CustomerSortField.place:
          cmp = (a.place ?? '').compareTo(b.place ?? '');
      }
      return _sortAscending ? cmp : -cmp;
    });
    final start = (_currentPage - 1) * _pageSize;
    return sorted.skip(start).take(_pageSize).toList();
  }

  Future<void> loadCustomers() async {
    _status = CustomerStatus.loading;
    _error = null;
    notifyListeners();

    try {
      _allCustomers = await _getAllUseCase.execute();
      _status = CustomerStatus.success;
      _currentPage = 1;
    } catch (e) {
      _error = e.toString();
      _status = CustomerStatus.failure;
    }
    notifyListeners();
  }

  Future<void> createCustomer({
    required String fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
  }) async {
    _status = CustomerStatus.loading;
    _error = null;
    notifyListeners();

    try {
      await _createUseCase.execute(
        fullName: fullName,
        type: type,
        place: place,
        address: address,
        phone: phone,
        notes: notes,
      );
      await loadCustomers();
    } catch (e) {
      _error = e.toString();
      _status = CustomerStatus.failure;
      notifyListeners();
    }
  }

  Future<void> deleteCustomer(int id) async {
    try {
      await _deleteUseCase.execute(id);
      await loadCustomers();
    } catch (e) {
      _error = e.toString();
      _status = CustomerStatus.failure;
      notifyListeners();
    }
  }

  void goToPage(int page) {
    if (page < 1 || page > totalPages) return;
    _currentPage = page;
    notifyListeners();
  }

  void toggleSort(CustomerSortField field) {
    if (_sortField == field) {
      _sortAscending = !_sortAscending;
    } else {
      _sortField = field;
      _sortAscending = true;
    }
    notifyListeners();
  }
}
