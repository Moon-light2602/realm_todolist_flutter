part of 'tasks_bloc.dart';

abstract class TasksState extends Equatable {

}

class TaskLoadingState extends TasksState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TasksState {
  RealmResults<Task> allTasks;

  TaskLoadedState({required this.allTasks});

  @override
  List<Object> get props => [allTasks];
}

class TaskErrorState extends TasksState {
  final String error;

  TaskErrorState(this.error);

  @override
  List<Object?> get props => [error];
}