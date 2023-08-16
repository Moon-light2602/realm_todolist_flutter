import 'package:realm/realm.dart';
import 'package:realm_todolist_flutter/models/task.dart';

class RealmDatabase {
  static RealmDatabase? _instance;
  final configure = Configuration.local([Task.schema], schemaVersion: 1);
  late Realm realm;

  RealmDatabase._() {
    realm = Realm(configure);
  }

  factory RealmDatabase() => _instance ??= RealmDatabase._();

  RealmResults<Task> getAllTask() {
    return realm.all<Task>();
  }

  void addTask(Task task) {
    task.isDone = false;
    realm.write(() {
      realm.add(task);
    });
  }

  void updateTask(Task task) {
    if (task.isDone == false) {
      realm.write(() {
        task.isDone = true;
      });
    } else if (task.isDone == true) {
      realm.write(() {
        task.isDone = false;
      });
    }
  }

  void deleteTask(Task task) {
    realm.write(() {
      realm.delete(task);
    });
  }
}
