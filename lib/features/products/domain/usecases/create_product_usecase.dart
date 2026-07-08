import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProductUseCase {
  final ProductRepository repository;

  const CreateProductUseCase(this.repository);

  Future<Product> execute({
    required String name,
    required int storeId,
    required int box,
    required int fill,
    required int currentState,
    required int price,
  }) =>
      repository.create(
        name: name,
        storeId: storeId,
        box: box,
        fill: fill,
        currentState: currentState,
        price: price,
      );
}
