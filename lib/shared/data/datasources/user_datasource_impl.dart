import '../../adapters/http_client_adapter.dart';
import '../../domain/datasources/user_datasource.dart';
import '../../models/user_model.dart';

class UserDatasourceImpl implements UserDatasource {
  final IHttpClientAdapter _client;

  const UserDatasourceImpl(this._client);

  static const _userMe = '/user/me';
  static const _loginWithToken = '/auth/login/:token';
  static const _logout = '/auth/logout/:token';

  @override
  Future<UserModel?> me() async {
    final response = await _client.get(_userMe);
    return response.fold((l) => throw l, (r) {
      final result = r.data['result'];

      return UserModel.fromJson(result);
    });
  }

  @override
  Future<String?> loginWithToken(String token) async {
    final response = await _client.post(
      _loginWithToken.replaceAll(':token', token),
    );
    return response.fold((l) => null, (r) {
      final token = r.data['token'];
      _client.setAuthorization(token);
      return token;
    });
  }

  @override
  Future<void> logout(String token) async {
    final response = await _client.post(
      _logout.replaceAll(':token', token),
    );

    response.fold((l) => throw l, (r) => null);
  }
}
