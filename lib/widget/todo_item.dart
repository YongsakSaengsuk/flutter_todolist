import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';


class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.getTask});
  final String getTask;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Neumorphic(
        margin: EdgeInsets.fromLTRB(6, 6, 0, 6),
        padding: EdgeInsets.all(20),
        style: NeumorphicStyle(
          color: Color(0xFFFBF5DD),
          depth: -3,
          intensity: 2,
          surfaceIntensity: 0.1,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Text(getTask)),
      ),
    );
  }
}
