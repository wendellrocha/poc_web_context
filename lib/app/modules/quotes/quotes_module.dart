import 'quotes_page.dart';
import 'quotes_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class QuotesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => QuotesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const QuotesPage()),
  ];
}
