import 'dart:async';

class AddTodoBloc {
  StreamController<List<String>> _streamListController =
      StreamController<List<String>>();

  Stream<List<String>> get listStream => _streamListController.stream;
  void readAllTodo() {
    _streamListController.sink.add(todos);
  }

  void addTodoList(String todo) {
    todos.add(todo);
    _streamListController.sink.add(todos);
  }

  void dispose() {
    _streamListController.close();
  }
}

AddTodoBloc addTodoBloc = AddTodoBloc();
List<String> todos = ['Làm việc nhà', 'Mua thức ăn', 'Đi xem phim'];
