import 'package:flutter/foundation.dart';
import '../../domain/entities/store.dart';
import '../../domain/repositories/store_repository.dart';

enum StoreStatus { idle, loading, success, failure }

class StoreProvider extends ChangeNotifier {
  final StoreRepository _repository;

  StoreProvider(this._repository);

  StoreStatus _status = StoreStatus.idle;
  List<Store> _stores = [];
  String? _error;

  StoreStatus get status => _status;
  List<Store> get stores => _stores;
  String? get error => _error;

  Future<void> loadStores() async {
    _status = StoreStatus.loading;
    _error = null;
    notifyListeners();

    try {
      _stores = await _repository.getAll();
      _status = StoreStatus.success;
    } catch (e) {
      _error = e.toString();
      _status = StoreStatus.failure;
    }
    notifyListeners();
  }

  Future<void> createStore(String name) async {
    _status = StoreStatus.loading;
    _error = null;
    notifyListeners();

    try {
      await _repository.create(name);
      await loadStores();
    } catch (e) {
      _error = e.toString();
      _status = StoreStatus.failure;
      notifyListeners();
    }
  }

  Future<void> deleteStore(int id) async {
    try {
      await _repository.delete(id);
      await loadStores();
    } catch (e) {
      _error = e.toString();
      _status = StoreStatus.failure;
      notifyListeners();
    }
  }
}
