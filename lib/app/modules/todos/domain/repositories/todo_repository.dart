import '../entities/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
}
