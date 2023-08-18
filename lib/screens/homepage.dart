
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../repository/realm_database.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'tasks_screen';

  @override
  State<HomePage> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<HomePage> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Tasks App'),
          actions: [
            IconButton(
              onPressed: () => RealmDatabase().getAllTask(),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ]
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            if(state is TaskLoadingState && RealmDatabase().getAllTask() == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TaskLoadedState) {
              RealmResults<Task> tasksList = state.allTasks;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Chip(
                      label: Text(
                        '${tasksList.length} tasks',
                      ),
                    ),
                  ),
                  TasksList(tasksList: tasksList),
                ],
              );
            }
            return const Text('You do not task to do!');
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}