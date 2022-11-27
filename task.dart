import 'package:flutter_application_22/Moduels/subtask.dart';
import 'package:intl/intl.dart';

class Task {
  String taskName;
  bool taskDone;
  DateTime dateTime;
  List<SubTask> subtasks = [];
  Task({
    required this.taskName,
    this.taskDone = false,
    required this.dateTime,
  });
  void changeStatus(Task task) {
    task.taskDone = !taskDone;
  }
}
