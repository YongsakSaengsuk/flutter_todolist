import 'dart:developer';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_todolist/Model/model.dart';
import 'package:flutter_todolist/addtodo.dart';
import 'package:flutter_todolist/widget/todolist.dart';

class Todolistpage extends StatefulWidget {
  const Todolistpage({super.key});

  @override
  State<Todolistpage> createState() => _TodolistpageState();
}

class _TodolistpageState extends State<Todolistpage> {
  final List<Model> _registeredTask = [
    Model(title: "Buy Milk", isDone: false),
    Model(title: "Cleaning", isDone: false),
    Model(title: "Study", isDone: false),
    Model(title: "Workout", isDone: false),
  ];

  void _showAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Addtodo(addtask: addTask),
    );
  }

  void addTask(Model task) {
    setState(() {
      _registeredTask.add(task);
    });
  }

  void removeTask(Model task) {
    final taskIndex = _registeredTask.indexOf(task);
    setState(() {
      _registeredTask.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredTask.insert(taskIndex, task);
          });
        },
      ),
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskOverlay,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ToDoList",
        ),
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
              tasks: _registeredTask,
              onRemoveTask: removeTask,
            )),
      ),
    );
  }
}
