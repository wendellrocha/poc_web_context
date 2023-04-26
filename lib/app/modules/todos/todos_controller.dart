import 'todos_store.dart';

class TodosController {
  final TodosStore _store;

  const TodosController(this._store);

  TodosStore get store => _store;

  void fetchTodos() => _store.fetchTodos();
}
