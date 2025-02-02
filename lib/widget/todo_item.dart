import 'package:flutter/material.dart';
import 'package:flutter_todolist/Model/model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.getTask});
  final Model getTask;
  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(getTask.id),
      margin: const EdgeInsets.all(8),
      color: Color(0xFFFBF5DD),
      child: ListTile(
        title: Text(getTask.title),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
