import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: const Text('Recycle Bin'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                ]
            ),
            drawer: const MyDrawer(),
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center (
                  child: Chip(
                    label: Text(
                      ' tasks',
                    ),
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}