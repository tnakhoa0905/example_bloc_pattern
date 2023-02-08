import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/todo.dart';

class AddTodoBloc with WidgetsBindingObserver {
  late final StreamSubscription<List<Todo>> _totoListener;
  AddTodoBloc(){
    WidgetsBinding.instance.addObserver(this);
    _totoListener = readAllTodo().listen((event) {
      print('**********'*30);
                print('rebuild');
      _streamListTodo.add( event);
      
    });
  }
  final StreamController<List<Todo>> _streamListTodo =
      StreamController<List<Todo>>();

  Stream<List<Todo>> get listTodoStream => _streamListTodo.stream;
  final docTodo = FirebaseFirestore.instance.collection('todo');

  Stream<List<Todo>> readAllTodo() {
    final todoSnapshot = FirebaseFirestore.instance
        .collection('todo')
        .orderBy('current_date', descending: true)
        .snapshots();
    return todoSnapshot.map(
        (event) => event.docs.map((e) => Todo.fromJson(e.data())).toList());
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
    return docTodo
        .doc(todoId)
        .update({'is_finish': true})
        .then((value) => print('todo updated'))
        .catchError((e) => print(e));
  }

  Future<void> deleteTodo(String todoId) {
    return docTodo
        .doc(todoId)
        .delete()
        .then((value) => print('Todo Delete'))
        .catchError((e) => print(e));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
      print('resumed');
      _totoListener.resume();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
      print('pause');
      _totoListener.pause();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void dispose() {
    _totoListener.pause();
    _totoListener.cancel();
    _streamListTodo.close();
    WidgetsBinding.instance.removeObserver(this);
  }
}

AddTodoBloc addTodoBloc = AddTodoBloc();
List<String> todos = ['Làm việc nhà', 'Mua thức ăn', 'Đi xem phim'];
