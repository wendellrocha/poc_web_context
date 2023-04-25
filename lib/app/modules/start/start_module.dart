import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_web_context/app/modules/comments/comments_module.dart';
import 'package:poc_web_context/app/modules/products/products_module.dart';
import 'package:poc_web_context/app/modules/quotes/quotes_module.dart';
import 'package:poc_web_context/app/modules/start/start_page.dart';
import 'package:poc_web_context/app/modules/start/start_store.dart';
import 'package:poc_web_context/app/modules/todos/todos_module.dart';

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
