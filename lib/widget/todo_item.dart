import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:flutter_todolist/Model/model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.getTask});
  final Model getTask;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(20),
      style: NeumorphicStyle(
       color: Color(0xFFFBF5DD), 
        depth: -3,
        intensity: 2,
        surfaceIntensity: 0.1,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      ),
      child: Text(getTask.title),
    );
  }
}
