import 'package:flutter/material.dart';
import 'package:todo_app_flutter/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms in Flutter',
      initialRoute: '/',
      onGenerateRoute: Router().getRoute,
    );
  }
}
