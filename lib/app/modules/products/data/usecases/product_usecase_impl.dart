import '../../domain/entities/product_model.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/product_usecase.dart';

class ProductUseCaseImpl implements ProductUseCase {
  final ProductRepository _repository;

  const ProductUseCaseImpl(this._repository);

  @override
  Future<List<ProductModel>> getProducts() => _repository.getProducts();
}
