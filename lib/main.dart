import 'package:flutter/material.dart';
import 'package:flutter_todolist/todolistpage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_todolist/Model/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TasksAdapter());
  await Hive.openBox<Tasks>('tasks');
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
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFDDA853),
          foregroundColor: Color(0xFF16404D),
        ),
      ),
      home: Todolistpage(),
    );
  }
}
