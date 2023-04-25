import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/user_usecase.dart';
import '../../models/user_model.dart';

class UserUseCaseImpl implements UserUseCase {
  final UserRepository _repository;

  const UserUseCaseImpl(this._repository);

  @override
  Future<UserModel?> me() async => _repository.me();
  @override
  Future<String?> loginWithToken(String token) async =>
      _repository.loginWithToken(token);

  @override
  Future<void> logout(String token) async => _repository.logout(token);
}
