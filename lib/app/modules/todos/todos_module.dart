import 'package:poc_web_context/app/modules/todos/todos_page.dart';
import 'package:poc_web_context/app/modules/todos/todos_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TodosStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TodosPage()),
  ];
}
