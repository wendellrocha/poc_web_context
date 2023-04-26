import '../../domain/datasources/product_datasource.dart';
import '../../domain/entities/product_model.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource _datasource;

  const ProductRepositoryImpl(this._datasource);

  @override
  Future<List<ProductModel>> getProducts() => _datasource.getProducts();
}
