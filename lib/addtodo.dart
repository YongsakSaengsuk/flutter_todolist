import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final taskController = TextEditingController();
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
          OutlinedButton(onPressed: () {}, child: Text("data"))
        ],
      ),
    );
  }
}
