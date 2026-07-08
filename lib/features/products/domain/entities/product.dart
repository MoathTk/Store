class Product {
  final int id;
  final String name;
  final int storeId;
  final int box;
  final int fill;
  final int currentState;
  final DateTime addedAt;

  const Product({
    required this.id,
    required this.name,
    required this.storeId,
    required this.box,
    required this.fill,
    required this.currentState,
    required this.addedAt,
  });

  int get initialState => box * fill;
}
