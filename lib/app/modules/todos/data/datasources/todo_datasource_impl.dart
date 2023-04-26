import '/shared/adapters/http_client_adapter.dart';
import '../../domain/datasources/todo_datasource.dart';
import '../../domain/entities/todo_model.dart';

class TodoDatasourceImpl implements TodoDatasource {
  final IHttpClientAdapter _client;

  const TodoDatasourceImpl(this._client);

  static const _todos = '/todos';

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await _client.get(_todos);
    return response.fold(
      (l) => throw l,
      (r) => (r.data['todos'] as List<dynamic>)
          .map((json) => TodoModel.fromJson(json))
          .toList(),
    );
  }
}
