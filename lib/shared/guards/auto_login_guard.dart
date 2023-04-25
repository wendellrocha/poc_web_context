import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../domain/usecases/user_usecase.dart';
import '../enums/prefs_type.dart';
import '../services/local_storage_service.dart';
import '../stores/user_store.dart';
import '../utils/utils.dart';

class AutoLoginGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    try {
      final LocalStorageService prefs = Modular.get();
      final UserUseCase userUseCase = Modular.get();
      final UserStore userStore = Modular.get();

      if (userStore.user != null) {
        return true;
      }

      final token = prefs.getString(PrefsType.token.value);

      if (token == null) {
        return false;
      }

      final newToken = await userUseCase.loginWithToken(token);

      if (newToken == null) {
        return false;
      }

      prefs.setString(PrefsType.token.value, newToken);
      final user = await userUseCase.me();

      if (user == null) {
        return false;
      }

      userStore.user = user;
      return true;
    } catch (e) {
      e.log;
      return false;
    }
  }
}
