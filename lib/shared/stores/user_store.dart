import 'package:flutter_triple/flutter_triple.dart';

import '../models/user_model.dart';

class UserStore {
  final RxNotifier<UserModel?> _user = RxNotifier<UserModel?>(null);

  UserModel? get user => _user.value;

  set user(UserModel? value) => _user.value = value;
}
