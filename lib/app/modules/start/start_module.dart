import 'package:flutter_modular/flutter_modular.dart';
import '../comments/comments_module.dart';
import '../products/products_module.dart';
import '../quotes/quotes_module.dart';
import 'start_page.dart';
import 'start_store.dart';
import '../todos/todos_module.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StartPage(),
      children: [
        ModuleRoute(
          '/products',
          module: ProductsModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/comments',
          module: CommentsModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/quotes',
          module: QuotesModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          '/todos',
          module: TodosModule(),
          transition: TransitionType.fadeIn,
        ),
      ],
    ),
  ];
}
