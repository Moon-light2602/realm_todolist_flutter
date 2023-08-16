import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';

part 'task.g.dart';

@RealmModel()
class _Task{
  late final String title;
  bool? isDone;
  bool? isDeleted;

//   Task({
//     required this.title,
//     this.isDone,
//     this.isDeleted,
//   }) {
//     isDone = isDone ?? false;
//     isDeleted = isDeleted ?? false;
//   }
//
//   Task copyWidth({
//     String? title,
//     bool? isDone,
//     bool? isDeleted,
// }) {
//     return Task (
//       title: title ?? this.title,
//       isDone: isDone ?? this.isDone,
//       isDeleted: isDeleted ?? this.isDeleted,
//     );
//   }
//
//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task(
//       title: map['title'] ?? '',
//       isDone: map['isDone'],
//       isDeleted: map['isDeleted'],
//     );
//   }
//
  @override
  List<Object?> get props => [
    title,
    isDone,
    isDeleted,
  ];

}