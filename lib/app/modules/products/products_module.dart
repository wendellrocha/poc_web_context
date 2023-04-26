import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/product_datasource_impl.dart';
import 'data/repositories/product_repository_impl.dart';
import 'data/usecases/product_usecase_impl.dart';
import 'pages/product_details/product_details_page.dart';
import 'products_controller.dart';
import 'products_page.dart';
import 'products_store.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductDatasourceImpl(i())),
    Bind.lazySingleton((i) => ProductRepositoryImpl(i())),
    Bind.lazySingleton((i) => ProductUseCaseImpl(i())),
    Bind.lazySingleton((i) => ProductsStore(i())),
    Bind.lazySingleton((i) => ProductsController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProductsPage()),
    ChildRoute(
      '/product/:id/:title',
      child: (_, args) => ProductDetailsPage(
        id: args.params['id'],
        title: Uri.decodeComponent(args.params['title']),
        product: args.data,
      ),
    )
  ];
}
