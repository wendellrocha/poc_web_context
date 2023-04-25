import '../../models/user_model.dart';

abstract class UserDatasource {
  Future<UserModel?> me();
  Future<String?> loginWithToken(String token);
  Future<void> logout(String token);
}
