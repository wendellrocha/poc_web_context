import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../services/local_storage_service.dart';
import '../stores/user_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final LocalStorageService prefs = Modular.get();

    final isLoggedin = Modular.get<UserStore>().user != null;

    if (!isLoggedin) {
      prefs.setObject('route', {
        'route': path,
        'args': Modular.args.data,
      });
    }

    return isLoggedin;
  }
}
