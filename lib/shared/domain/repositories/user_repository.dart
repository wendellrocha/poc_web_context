import '../../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> me();
  Future<String?> loginWithToken(String token);
  Future<void> logout(String token);
}
