import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../services/local_storage_service.dart';

class ContextGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final LocalStorageService prefs = Modular.get();
    prefs.setObject('route', {'path': path, 'args': Modular.args.data});
    return true;
  }
}
