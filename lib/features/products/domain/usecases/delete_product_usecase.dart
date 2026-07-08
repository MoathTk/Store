import '../repositories/product_repository.dart';

class DeleteProductUseCase {
  final ProductRepository repository;

  const DeleteProductUseCase(this.repository);

  Future<void> execute(int id) => repository.delete(id);
}
