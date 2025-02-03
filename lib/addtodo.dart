import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_todolist/Model/model.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key, required this.addtask});
  final void Function(Model task) addtask;
  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final taskController = TextEditingController();
  void _summitTaskData() {
    if (taskController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('No value'),
          content: const Text('Please Enter Task'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        ),
      );
      return;
    }
    widget.addtask(Model(title: taskController.text, isDone: false));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: Color(0xFFA6CDC6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              label: Text("back"),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    depth: 3,
                    intensity: 0.6,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter task here"),
                  ),
                ),
              ),
              NeumorphicButton(
                style: NeumorphicStyle(
                  color: Color(0xFFDDA853),
                  depth: 5,
                  intensity: 0.8,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                ),
                onPressed: _summitTaskData,
                child: Text("Save Task"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
