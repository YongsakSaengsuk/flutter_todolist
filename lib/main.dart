import 'package:flutter/material.dart';
import 'package:flutter_todolist/todolistpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFDDA853)),
        scaffoldBackgroundColor: Color(0xFF16404D),
        
      ),
      home: Todolistpage(),
    );
  }
}
