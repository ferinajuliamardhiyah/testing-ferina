import 'package:flutter/material.dart';

class ListCounter extends StatelessWidget {
  final title;
  final status; 
  final color;
  final icon;

  ListCounter(this.title, this.status, this.color, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
    elevation: 5,
    child: Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: color, fontSize: 32),
          ),
          Icon(
            icon,
            size: 48,
            color: color,
          ),
          Text(
            status,
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    ));
  }
}