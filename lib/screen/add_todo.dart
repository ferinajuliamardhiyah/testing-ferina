import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  final handleTodo;

  AddScreen(this.handleTodo);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            onSubmitted: (val) {
              handleTodo(val);
              Navigator.pop(context);
            },
            autofocus: true,
            decoration: InputDecoration(
                hintText: "Add To Do", labelText: "Add new To Do"),
          ),
        ));
  }
}
