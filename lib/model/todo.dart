class Todo {
  final String title;
  final String description;
  final bool status;

  Todo(this.title, this.description, this.status);

  static getTodos() {
    return List.generate(
        20,
        (i) => Todo('Todo ${i + 1}',
            "A description of what needs to be done for Todo ${i + 1}", false));
  }
}
