import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_todolist_flutter/blocs/bloc_exports.dart';
import 'package:realm_todolist_flutter/repository/realm_database.dart';
import 'package:realm_todolist_flutter/widgets/task_tile.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {

  TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  RealmResults<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return TaskTile(task: task);
        },
      ),
    );
  }
}


