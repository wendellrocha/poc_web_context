import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/product_model.dart';
import 'domain/usecases/product_usecase.dart';

class ProductsStore extends Store<List<ProductModel>> {
  final ProductUseCase _useCase;

  ProductsStore(this._useCase) : super(<ProductModel>[]);

  void fetchProducts() => execute(() => _useCase.getProducts());
}
