import '../../domain/entities/order_item.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required super.id,
    required super.orderId,
    required super.itemId,
    required super.storeId,
    required super.boxes,
    required super.fill,
    required super.price,
    super.isPaid,
  });

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      id: map['id'] as int,
      orderId: map['orderId'] as int,
      itemId: map['itemId'] as int,
      storeId: map['storeId'] as int,
      boxes: map['boxes'] as int,
      fill: map['fill'] as int,
      price: map['price'] as int,
      isPaid: (map['isPaid'] as int?) == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'itemId': itemId,
      'storeId': storeId,
      'boxes': boxes,
      'fill': fill,
      'price': price,
      'isPaid': isPaid ? 1 : 0,
    };
  }
}
