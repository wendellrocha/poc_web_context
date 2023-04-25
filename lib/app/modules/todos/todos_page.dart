import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_web_context/app/modules/todos/todos_store.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatefulWidget {
  final String title;
  const TodosPage({Key? key, this.title = 'TodosPage'}) : super(key: key);
  @override
  TodosPageState createState() => TodosPageState();
}
class TodosPageState extends State<TodosPage> {
  final TodosStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}