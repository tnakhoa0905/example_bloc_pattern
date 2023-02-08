import 'dart:convert';

class Todo {
  String id;
  final String content;
  final bool is_finish;
  final DateTime current_date;
  Todo(
      {required this.id,
      required this.content,
      required this.is_finish,
      required this.current_date});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'is_finish': is_finish,
      'current_date': current_date
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
        id: map['id']??'',
        content: map['content']??'',
        is_finish: map['is_finish']??false,
        current_date: map['current_date'].toDate());
  }
}
