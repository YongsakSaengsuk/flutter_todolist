import 'package:flutter/material.dart';
import 'package:flutter_todolist/Model/model.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key, required this.tasks});
  final List<Model> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          key: ValueKey(tasks[index].id),
          margin: const EdgeInsets.all(8),
          color: Color(0xFFFBF5DD),
          child: ListTile(
            title: Text(tasks[index].title),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        );
      },
    );
  }
}
