import 'package:poc_web_context/app/modules/comments/comments_page.dart';
import 'package:poc_web_context/app/modules/comments/comments_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CommentsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CommentsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CommentsPage()),
  ];
}
