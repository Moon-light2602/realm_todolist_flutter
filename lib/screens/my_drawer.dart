import 'package:flutter/material.dart';
import 'package:realm_todolist_flutter/screens/homepage.dart';
import 'package:realm_todolist_flutter/screens/recycle_bin.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.orangeAccent,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 90,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('TO-DOs'),
              ],
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(HomePage.id),
                child:
                ListTile(
                  leading: const Icon(Icons.list_outlined),
                  title: const Text('TO-DO List'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                child:
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Recycle Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }


}