import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/todo_model.dart';
import 'domain/usecases/todo_usecase.dart';

class TodosStore extends Store<List<TodoModel>> {
  final TodoUseCase _useCase;

  TodosStore(this._useCase) : super(<TodoModel>[]);

  void fetchTodos() => execute(() => _useCase.getTodos());
}
