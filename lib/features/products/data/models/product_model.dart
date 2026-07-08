import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.storeId,
    required super.box,
    required super.fill,
    required super.currentState,
    required super.addedAt,
  });

  factory ProductModel.fromCreateParams({
    required int id,
    required String name,
    required int storeId,
    required int box,
    required int fill,
    required int currentState,
    required DateTime addedAt,
  }) {
    return ProductModel(
      id: id,
      name: name,
      storeId: storeId,
      box: box,
      fill: fill,
      currentState: currentState,
      addedAt: addedAt,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      storeId: map['storeId'] as int,
      box: map['box'] as int,
      fill: map['fill'] as int,
      currentState: map['currentState'] as int,
      addedAt: DateTime.parse(map['addedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'storeId': storeId,
      'box': box,
      'fill': fill,
      'currentState': currentState,
      'addedAt': addedAt.toIso8601String(),
    };
  }
}
