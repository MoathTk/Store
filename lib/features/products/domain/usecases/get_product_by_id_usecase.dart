import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductByIdUseCase {
  final ProductRepository repository;

  const GetProductByIdUseCase(this.repository);

  Future<Product?> execute(int id) => repository.getById(id);
}
