import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_web_context/app/modules/splash/splash_module.dart';
import 'package:poc_web_context/app/modules/start/start_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/start', module: StartModule()),
  ];
}
