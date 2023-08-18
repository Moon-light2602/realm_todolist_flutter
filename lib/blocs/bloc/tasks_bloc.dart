import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';

import '../../models/task.dart';
import '../../repository/realm_database.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  RealmDatabase db = RealmDatabase();

  TasksBloc(this.db): super(TaskLoadedState(allTasks: db.getAllTask())) {
    on<LoadTaskEvent>(_onLoadTask);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    //on<RemoveTask>(_onRemoveTask);
  }

  void _onLoadTask(event, emit) {
    emit(TaskLoadingState());
    try {
      final tasks = db.getAllTask();
      emit(TaskLoadedState(allTasks: tasks));
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    var task = event.task;
    db.addTask(task);
    var tasks = db.getAllTask();

    emit(TaskLoadedState(
      allTasks: tasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final task = event.task;
    db.updateTask(task);
    emit(TaskLoadedState(
      allTasks: db.getAllTask(),
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    db.deleteTask(event.task);
    emit(TaskLoadedState(
      allTasks: db.getAllTask(),
    ));
  }

}