import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_web_context/app/modules/auth/auth_page.dart';
import 'package:poc_web_context/app/modules/auth/auth_store.dart';
import 'package:poc_web_context/app/modules/auth/pages/login/login_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AuthPage()),
  ];
}
