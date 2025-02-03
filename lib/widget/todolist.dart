import 'package:flutter/material.dart';
import 'package:flutter_todolist/Model/task_model.dart';
import 'package:flutter_todolist/widget/todo_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Todolist extends StatelessWidget {
  const Todolist(
      {super.key, required this.taskBox, required this.onRemoveTask});
  final Box<Tasks> taskBox;
  final void Function(int) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Tasks>>(
      valueListenable: taskBox.listenable(), // Listen for changes
      builder: (context, Box<Tasks> box, _) {
        if (box.isEmpty) {
          return const Center(child: Text("No tasks yet"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: box.length,
          itemBuilder: (context, index) {
            final task = box.getAt(index);

            return Dismissible(
              background: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
              ),
              key: ValueKey(task!.id), // Use title as key (since no ID)
              movementDuration: const Duration(milliseconds: 250),
              confirmDismiss: (direction) => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        onRemoveTask(index); // Pass index instead of object
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    )
                  ],
                ),
              ),
              direction: DismissDirection.endToStart,
              child: TodoItem(getTask: task.title),
            );
          },
        );
      },
    );
  }
}