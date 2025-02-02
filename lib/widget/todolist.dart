import 'package:flutter/material.dart';
import 'package:flutter_todolist/Model/model.dart';
import 'package:flutter_todolist/widget/todo_item.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key, required this.tasks});
  final List<Model> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: ValueKey(tasks[index].id),
            child: TodoItem(
              getTask: tasks[index],
            ));
      },
    );
  }
}
