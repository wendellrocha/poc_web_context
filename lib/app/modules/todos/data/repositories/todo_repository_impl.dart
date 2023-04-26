import '../../domain/entities/todo_model.dart';
import '../../domain/repositories/todo_repository.dart';

import '../../domain/datasources/todo_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource _datasource;

  const TodoRepositoryImpl(this._datasource);

  @override
  Future<List<TodoModel>> getTodos() => _datasource.getTodos();
}
