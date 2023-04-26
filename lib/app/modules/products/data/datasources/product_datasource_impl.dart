import '/shared/adapters/http_client_adapter.dart';
import '../../domain/datasources/product_datasource.dart';
import '../../domain/entities/product_model.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final IHttpClientAdapter _client;

  const ProductDatasourceImpl(this._client);

  static const _product = '/product';

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _client.get(_product);
    return response.fold(
      (l) => throw l,
      (r) => (r.data['products'] as List<dynamic>)
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList(),
    );
  }
}
