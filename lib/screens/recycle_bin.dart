import 'package:flutter/material.dart';
import 'package:realm_todolist_flutter/screens/my_drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/tasks_list.dart';
import 'homepage.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(onPressed: () {},
                  icon: const Icon(Icons.add)),
            ],
            backgroundColor: Colors.orangeAccent,
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} Tasks',
                  ),
                ),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}