// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Task extends _Task with RealmEntity, RealmObjectBase, RealmObject {
  Task(
    String title, {
    bool? isDone,
    bool? isDeleted,
  }) {
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'isDone', isDone);
    RealmObjectBase.set(this, 'isDeleted', isDeleted);
  }

    Task copyWidth({
    String? title,
    bool? isDone,
    bool? isDeleted,
});

  Task._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => throw RealmUnsupportedSetError();

  @override
  bool? get isDone => RealmObjectBase.get<bool>(this, 'isDone') as bool?;
  @override
  set isDone(bool? value) => RealmObjectBase.set(this, 'isDone', value);

  @override
  bool? get isDeleted => RealmObjectBase.get<bool>(this, 'isDeleted') as bool?;
  @override
  set isDeleted(bool? value) => RealmObjectBase.set(this, 'isDeleted', value);

  @override
  Stream<RealmObjectChanges<Task>> get changes =>
      RealmObjectBase.getChanges<Task>(this);

  @override
  Task freeze() => RealmObjectBase.freezeObject<Task>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Task._);
    return const SchemaObject(ObjectType.realmObject, Task, 'Task', [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('isDone', RealmPropertyType.bool, optional: true),
      SchemaProperty('isDeleted', RealmPropertyType.bool, optional: true),
    ]);
  }
}
