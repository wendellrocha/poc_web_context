import '../../models/user_model.dart';

abstract class UserUseCase {
  Future<UserModel?> me();
  Future<String?> loginWithToken(String token);
  Future<void> logout(String token);
}
