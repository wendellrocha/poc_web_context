import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:lottie/lottie.dart';

import '/shared/http/errors/http_error.dart';
import '/shared/resources/resources.dart';
import 'domain/entities/todo_model.dart';
import 'todos_controller.dart';
import 'todos_store.dart';

class TodosPage extends StatefulWidget {
  final String title;
  const TodosPage({Key? key, this.title = 'TodosPage'}) : super(key: key);
  @override
  TodosPageState createState() => TodosPageState();
}

class TodosPageState extends State<TodosPage> {
  final TodosController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<TodosStore, List<TodoModel>>(
      store: controller.store,
      onLoading: (context) => Center(
        child: LottieBuilder.asset(Lotties.loading),
      ),
      onError: (context, error) {
        if (error is HttpError) {
          return Text(error.toString());
        }

        return Text(error);
      },
      onState: (context, state) => ListView.separated(
        itemCount: state.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = state[index];

          return ListTile(
            title: Text(
              item.todo!,
              style: TextStyle(
                decoration:
                    item.completed ?? false ? TextDecoration.lineThrough : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
