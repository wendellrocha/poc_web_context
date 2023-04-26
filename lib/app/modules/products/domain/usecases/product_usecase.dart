import '../entities/product_model.dart';

abstract class ProductUseCase {
  Future<List<ProductModel>> getProducts();
}
