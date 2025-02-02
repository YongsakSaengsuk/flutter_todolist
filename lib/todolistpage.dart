import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todolist/addtodo.dart';
import 'package:flutter_todolist/data/data.dart';

class Todolistpage extends StatefulWidget {
  const Todolistpage({super.key});

  @override
  State<Todolistpage> createState() => _TodolistpageState();
}

class _TodolistpageState extends State<Todolistpage> {
  @override
  Widget build(BuildContext context) {
    log('message');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Addtodo(),
          );
        },
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
        child: Container(
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFA6CDC6),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
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
    );
  }
}
