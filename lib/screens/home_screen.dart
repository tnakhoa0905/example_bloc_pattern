import 'package:example_bloc_pattern/bloc/addtodo_bloc.dart';
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
            body: StreamBuilder<List<String>>(
              stream: addTodoBloc.listStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('error ${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  print(snapshot);
                  return const Center(
                    child: Text('Không có công việc nào'),
                  );
                }
                print(snapshot);
                List<String>? listTodo = snapshot.data;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listTodo!.length,
                    itemBuilder: ((context, index) => ListTile(
                          title: Text(
                            '${listTodo[index]}',
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
                    addTodoBloc.addTodoList(_todoController.text);
                    Navigator.of(context).pop();
                    _todoController.clear();
                  },
                  child: Text('Thêm'))
            ],
          ));
}
