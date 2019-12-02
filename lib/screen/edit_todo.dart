import 'package:flutter/material.dart';
import 'package:todo_app_flutter/model/todo.dart';

class EditScreen extends StatelessWidget {
  final editTodo;
  final Todo todo;
  final index;

  EditScreen({this.editTodo, this.todo, this.index});

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit ${todo.title}'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: TextEditingController(text: todo.title),
            onSubmitted: (val) {
              editTodo(val, index, todo.status);
              Navigator.pop(context);
            },
            autofocus: true,
            decoration: InputDecoration(
                hintText: todo.title, labelText: "Edit ${todo.title}"),
          ),
        ));
  }
}
