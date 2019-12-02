import 'package:flutter/material.dart';
import 'package:todo_app_flutter/model/todo.dart';

class DetailScreen extends StatefulWidget {
  final Todo todo;

  DetailScreen({this.todo});

  DetailState createState() => DetailState(todo: this.todo);
}

class DetailState extends State<DetailScreen> {
  final Todo todo;

  DetailState({this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Ink(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Text(todo.description),
          ],
        ),
      ),
    );
  }
}
