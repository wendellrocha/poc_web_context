import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/adapters/dio_adapter.dart';
import '../shared/services/shared_preferences_service_impl.dart';
import '../shared/stores/user_store.dart';
import 'modules/splash/splash_module.dart';
import 'modules/start/start_module.dart';

late final SharedPreferences _sharedPreferences;

class AppModule extends Module {
  final SharedPreferences sharedPreferences;

  AppModule({required this.sharedPreferences}) {
    _sharedPreferences = sharedPreferences;
  }

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DioAdapter()),
    Bind.lazySingleton((i) => SharedPreferencesServiceImpl(_sharedPreferences)),
    Bind.lazySingleton((i) => UserStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/start', module: StartModule()),
  ];
}
