import '../entities/todo_model.dart';

abstract class TodoUseCase {
  Future<List<TodoModel>> getTodos();
}
