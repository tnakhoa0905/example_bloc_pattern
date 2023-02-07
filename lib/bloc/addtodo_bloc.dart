import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/todo.dart';

class AddTodoBloc {
  StreamController<List<String>> _streamListTodo =
      StreamController<List<String>>();

  Stream<List<String>> get listTodoStream => _streamListTodo.stream;

  Stream<QuerySnapshot> readAllTodo() {
    final todoSnapshot = FirebaseFirestore.instance
        .collection('todo')
        .orderBy('current_date', descending: true)
        .snapshots();
    return todoSnapshot;
  }

  void addTodoList(String todo) {
    todos.add(todo);
    _streamListTodo.sink.add(todos);
  }

  Future<void> addTodo(Todo content) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc();
    content.id = docTodo.id;
    return docTodo
        .set(content.toJson())
        .then((value) => print("Todo Added"))
        .catchError((e) => print(e));
  }

  Future<void> finishTodo(String todoId) {
    final docTodo = FirebaseFirestore.instance.collection('todo');
    return docTodo
        .doc(todoId)
        .update({'is_finish': true})
        .then((value) => print('todo updated'))
        .catchError((e) => print(e));
  }

  void dispose() {
    _streamListTodo.close();
  }
}

AddTodoBloc addTodoBloc = AddTodoBloc();
List<String> todos = ['Làm việc nhà', 'Mua thức ăn', 'Đi xem phim'];
