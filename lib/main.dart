import 'package:flutter/material.dart';
import 'task_list.dart';
import 'task_form.dart';
import 'task_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TaskList(),
        '/form': (context) => TaskForm(),
        '/details': (context) => TaskDetails(),
      },
    );
  }
}