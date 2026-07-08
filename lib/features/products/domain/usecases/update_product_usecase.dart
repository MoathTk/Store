import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProductUseCase {
  final ProductRepository repository;

  const UpdateProductUseCase(this.repository);

  Future<Product> execute({
    required int id,
    String? name,
    int? storeId,
    int? box,
    int? fill,
    int? currentState,
    int? price,
  }) =>
      repository.update(
        id: id,
        name: name,
        storeId: storeId,
        box: box,
        fill: fill,
        currentState: currentState,
        price: price,
      );
}
