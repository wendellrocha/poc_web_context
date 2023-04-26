import '../entities/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> getProducts();
}
