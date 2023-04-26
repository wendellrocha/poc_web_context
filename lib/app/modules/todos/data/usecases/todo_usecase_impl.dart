import '../../domain/entities/todo_model.dart';
import '../../domain/repositories/todo_repository.dart';
import '../../domain/usecases/todo_usecase.dart';

class TodoUseCaseImpl implements TodoUseCase {
  final TodoRepository _repository;

  const TodoUseCaseImpl(this._repository);

  @override
  Future<List<TodoModel>> getTodos() => _repository.getTodos();
}
