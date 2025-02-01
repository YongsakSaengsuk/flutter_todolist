import 'package:flutter/material.dart';
import 'package:flutter_todolist/data/data.dart';

class Todolistpage extends StatefulWidget {
  const Todolistpage({super.key});

  @override
  State<Todolistpage> createState() => _TodolistpageState();
}

class _TodolistpageState extends State<Todolistpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ToDoList",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Center(
          child: Container(
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFA6CDC6),
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFFBF5DD),
                    child: ListTile(
                      title: Text(todos[index].title),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
