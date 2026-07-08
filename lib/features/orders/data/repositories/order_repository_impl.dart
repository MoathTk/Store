import '../../domain/entities/order.dart';
import '../../domain/entities/order_status.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_local_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource _dataSource;

  OrderRepositoryImpl(this._dataSource);

  @override
  Future<List<Order>> getAll() => _dataSource.getAll();

  @override
  Future<Order?> getById(int id) => _dataSource.getById(id);

  @override
  Future<Order> create(CreateOrderParams params) => _dataSource.create(params);

  @override
  Future<Order> update({
    required int id,
    DateTime? date,
    int? customerId,
    String? notes,
    OrderStatus? status,
  }) =>
      _dataSource.update(
        id: id,
        date: date,
        customerId: customerId,
        notes: notes,
        status: status,
      );

  @override
  Future<void> delete(int id) => _dataSource.delete(id);

  @override
  Future<Order> markItemPaid(int orderItemId) =>
      _dataSource.markItemPaid(orderItemId);
}
