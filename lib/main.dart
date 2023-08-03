import 'package:flutter/material.dart';
import 'package:realm_todolist_flutter/models/task.dart';
import 'blocs/bloc_exports.dart';
import 'screens/homepage.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(AddTask(
            task: Task(
                title: 'Task 1'))),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(title: 'TODO List',),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

