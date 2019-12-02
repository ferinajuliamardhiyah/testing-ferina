import 'package:flutter/material.dart';
import 'package:todo_app_flutter/pages.dart';
import 'package:todo_app_flutter/screen/add_todo.dart';
import 'package:todo_app_flutter/screen/detail_screen.dart';
import 'package:todo_app_flutter/screen/edit_todo.dart';
import 'package:todo_app_flutter/screen/login.dart';
import 'package:todo_app_flutter/screen/todo_screen.dart';

class Router {
  Route<dynamic> getRoute(settings) {
    Map<String, dynamic> arguments = settings.arguments;

    switch (settings.name) {
      case Pages.Home:
        return _buildRoute(settings, LoginPage());
      case Pages.List:
        return _buildRoute(settings, TodoScreen());
      case Pages.Add:
        return _buildRoute(settings, AddScreen(arguments['handleTodo']));
      case Pages.Edit:
        return _buildRoute(
            settings,
            EditScreen(
              editTodo: arguments['editTodo'],
              index: arguments['index'],
              todo: arguments['todo'],
            ));
      case Pages.Detail:
        return _buildRoute(settings, DetailScreen(todo: arguments['todo']));
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
