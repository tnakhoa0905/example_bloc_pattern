import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example_bloc_pattern/bloc/addtodo_bloc.dart';
import 'package:example_bloc_pattern/model/todo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  late TextEditingController _todoController;
  @override
  void initState() {
    addTodoBloc.readAllTodo();
    _todoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addTodoBloc.dispose();
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      openDialog();
                    },
                  ),
                ],
                title: const Text(
                  'Công việc cần làm',
                  textAlign: TextAlign.center,
                )),
            body: StreamBuilder(
              stream: addTodoBloc.readAllTodo(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('error ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Không có công việc nào'),
                  );
                }
                List<Todo> todos = snapshot.data!.docs
                    .map((e) => Todo.fromJson(e.data() as Map<String, dynamic>))
                    .toList();
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: ((context, index) => ListTile(
                          trailing: Column(children: [
                            IconButton(
                                onPressed: () {
                                  addTodoBloc.finishTodo(todos[index].id);
                                },
                                icon: Icon(todos[index].is_finish == false
                                    ? Icons.check
                                    : Icons.ac_unit_outlined))
                          ]),
                          title: Text(
                            todos[index].content,
                            textAlign: TextAlign.center,
                          ),
                        )));
              },
            )));
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Thêm công việc'),
            content: TextField(
                controller: _todoController,
                autofocus: true,
                decoration:
                    InputDecoration(hintText: 'Nhập công việc của bạn')),
            actions: [
              TextButton(
                  onPressed: () {
                    addTodoBloc.addTodo(Todo(
                        id: '',
                        content: _todoController.text,
                        is_finish: false,
                        current_date: DateTime.now()));
                    Navigator.of(context).pop();
                    _todoController.clear();
                  },
                  child: Text('Thêm'))
            ],
          ));
}
