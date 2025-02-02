import 'package:flutter/material.dart';
import 'package:flutter_todolist/Model/model.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key, required this.addtask});
  final void Function(Model task) addtask;
  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final taskController = TextEditingController();
  void _summitTaskData(){
    if (taskController.text.trim().isEmpty ) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: const Text('No value'),
        content: const Text('Please Enter Task'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),);
      return;
    }
    widget.addtask(Model(title: taskController.text, isDone: false));
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          OutlinedButton(onPressed: _summitTaskData, child: Text("data"))
        ],
      ),
    );
  }
}
