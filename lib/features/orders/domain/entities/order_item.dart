class OrderItem {
  final int id;
  final int orderId;
  final int itemId;
  final int storeId;
  final int boxes;
  final int fill;
  final int price;
  final bool isPaid;

  const OrderItem({
    required this.id,
    required this.orderId,
    required this.itemId,
    required this.storeId,
    required this.boxes,
    required this.fill,
    required this.price,
    this.isPaid = false,
  });

  int get totalItems => boxes * fill;
  int get lineTotal => boxes * fill * price;
}
