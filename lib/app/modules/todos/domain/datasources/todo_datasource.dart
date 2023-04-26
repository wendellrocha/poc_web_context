import '../entities/todo_model.dart';

abstract class TodoDatasource {
  Future<List<TodoModel>> getTodos();
}
