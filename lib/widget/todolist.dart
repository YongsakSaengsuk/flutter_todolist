import 'package:flutter/material.dart';
import 'package:flutter_todolist/Model/model.dart';
import 'package:flutter_todolist/widget/todo_item.dart';

class Todolist extends StatelessWidget {
  const Todolist({super.key, required this.tasks, required this.onRemoveTask});
  final List<Model> tasks;
  final void Function(Model) onRemoveTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            key: ValueKey(tasks[index].id),
            movementDuration: Duration(milliseconds: 250),
            confirmDismiss: (direction) => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Delete?'),
                    actions: [
                      TextButton(
                          onPressed: () => onRemoveTask(tasks[index]),
                          child: Text("OK")),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'))
                    ],
                  ),
                ),
            direction: DismissDirection.endToStart,
            child: TodoItem(
              getTask: tasks[index],
            ));
      },
    );
  }
}
