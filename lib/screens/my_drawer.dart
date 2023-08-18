import 'package:flutter/material.dart';
import 'package:realm_todolist_flutter/screens/homepage.dart';
import 'package:realm_todolist_flutter/screens/recycle_bin.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(HomePage.id),
                    child: const ListTile(
                      leading: Icon(Icons.folder_special),
                      title: Text('My Tasks'),
                      trailing: Text('0'),
                    ),
                  );
                }
            ),
            BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                    child: const ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Recycle Bin'),
                      trailing: Text('0'),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}