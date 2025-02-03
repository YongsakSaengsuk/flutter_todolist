import 'dart:developer';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:flutter_todolist/Model/task_model.dart';
import 'package:flutter_todolist/addtodo.dart';
import 'package:flutter_todolist/widget/todolist.dart';
import 'package:hive/hive.dart';

class Todolistpage extends StatefulWidget {
  const Todolistpage({super.key});

  @override
  State<Todolistpage> createState() => _TodolistpageState();
}

class _TodolistpageState extends State<Todolistpage> {
  late Box<Tasks> taskBox;

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box<Tasks>('tasks');
  }

  void _showAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Addtodo(addtask: addTask),
    );
  }

  void addTask(String title) {
    final newTask = Tasks(title: title);
    taskBox.add(newTask);
    setState(() {}); // Update UI after adding a task
  }

  void removeTask(int index) {
    taskBox.deleteAt(index);
    setState(() {}); // Update UI after removing a task
  }

  @override
  Widget build(BuildContext context) {
    log('Building TodolistPage');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskOverlay,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("ToDoList"),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 100),
        child: Neumorphic(
            style: NeumorphicStyle(
              color: Color(0xFFA6CDC6),
              depth: 5,
              intensity: 0.3,
              shadowDarkColor: Colors.black,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
            ),
            child: Todolist(
              taskBox: taskBox,
              onRemoveTask: removeTask,
            )),
      ),
    );
  }
}
