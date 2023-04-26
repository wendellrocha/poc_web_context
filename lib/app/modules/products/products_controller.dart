import 'products_store.dart';

class ProductsController {
  final ProductsStore _store;

  const ProductsController(this._store);

  ProductsStore get store => _store;

  void fetchProducts() => _store.fetchProducts();
}
