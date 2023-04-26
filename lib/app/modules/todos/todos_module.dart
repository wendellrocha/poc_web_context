import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/todo_datasource_impl.dart';
import 'data/repositories/todo_repository_impl.dart';
import 'data/usecases/todo_usecase_impl.dart';
import 'todos_controller.dart';
import 'todos_page.dart';
import 'todos_store.dart';

class TodosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TodoDatasourceImpl(i())),
    Bind.lazySingleton((i) => TodoRepositoryImpl(i())),
    Bind.lazySingleton((i) => TodoUseCaseImpl(i())),
    Bind.lazySingleton((i) => TodosStore(i())),
    Bind.lazySingleton((i) => TodosController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TodosPage()),
  ];
}
