import '../../domain/datasources/user_datasource.dart';
import '../../domain/repositories/user_repository.dart';
import '../../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;

  const UserRepositoryImpl(this._datasource);

  @override
  Future<UserModel?> me() async => _datasource.me();

  @override
  Future<String?> loginWithToken(String token) async =>
      _datasource.loginWithToken(token);

  @override
  Future<void> logout(String token) async => _datasource.logout(token);
}
