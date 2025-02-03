import 'package:flutter/material.dart';

import 'package:flutter_todolist/Model/model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.getTask});
  final Model getTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(5, 6),
              blurRadius: 15,
              spreadRadius: 2)
        ],
      ),
      child: Text(getTask.title),
    );
  }
}
