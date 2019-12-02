import 'package:flutter/material.dart';
import 'package:todo_app_flutter/model/todo.dart';
import 'package:todo_app_flutter/pages.dart';
import 'package:todo_app_flutter/widgets/listcounter.dart';

class TodoScreen extends StatefulWidget {
  TodoState createState() => TodoState();
}

class TodoState extends State<TodoScreen> {
  List<Todo> todos = Todo.getTodos();
  bool checkAll = false;
  String filtered = "total";

  handleTodo(todo) {
    setState(() {
      todos.add(Todo(
          todo,
          'A description of what needs to be done for $todo ${todos.length + 1}',
          false));
    });
  }

  editTodo(todo, index, status) {
    setState(() {
      todos[index] = Todo(
          '$todo', 'A description of what needs to be done for $todo', status);
      checkAll =
          todos.where((item) => item.status == true).length == todos.length;
    });
  }

  handleCheckAll(value) {
    setState(() {
      checkAll = value;
      todos = todos
          .map((item) => Todo(item.title, item.description, value))
          .toList();
    });
  }

  handleDeleteAll() {
    setState(() {
      todos = todos.where((item) => item.status == false).toList();
      checkAll = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ListView listViewWidget = ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          child: Dismissible(
            onDismissed: (direction) {
              return setState(() {
                todos.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(
                todos[index].title,
                style: TextStyle(
                    decoration: todos[index].status
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: todos[index].status ? Colors.green : Colors.red),
              ),
              leading: Checkbox(
                  value: todos[index].status,
                  onChanged: (value) {
                    editTodo(todos[index].title, index, value);
                  }),
              onLongPress: () {
                Navigator.pushNamed(context, Pages.Edit, arguments: {
                  "editTodo": editTodo,
                  "todo": todos[index],
                  "index": index
                });
              },
              onTap: () {
                Navigator.pushNamed(context, Pages.Detail,
                    arguments: {"todo": todos[index]});
              },
            ),
            key: Key(todos[index].title),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListCounter(
                      'Done',
                      todos
                          .where((test) => test.status == true)
                          .length
                          .toString(),
                      Colors.green,
                      Icons.done),
                  ListCounter(
                    'Todo',
                    todos
                        .where((test) => test.status == false)
                        .length
                        .toString(),
                    Colors.red,
                    Icons.today,
                  ),
                  ListCounter('Total', todos.length.toString(), Colors.blue,
                      Icons.calendar_today),
                ]),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Check All"),
                    Checkbox(
                      onChanged: (e) {
                        handleCheckAll(e);
                      },
                      value: checkAll,
                    )
                  ],
                ),
                Column(
                 children: <Widget>[
                   Text('Delete All'),
                   IconButton(
                     icon: Icon(Icons.delete),
                     iconSize: 28,
                     color: Colors.red,
                     onPressed: handleDeleteAll(),
                   )
                 ])
              ]),
          Expanded(
            child: todos.length > 0
                ? listViewWidget
                : Padding(
                    child: Text(
                      'No Todos Yet',
                      style: TextStyle(color: Colors.blue, fontSize: 32),
                    ),
                    padding: EdgeInsets.all(20),
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, Pages.Add,
              arguments: {'handleTodo': handleTodo});
        },
      ),
    );
  }
}
