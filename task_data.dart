import 'package:flutter/widgets.dart';
import 'package:flutter_application_22/Moduels/subtask.dart';
import 'package:flutter_application_22/Moduels/task.dart';

class Task_data extends ChangeNotifier {
  List<Task> tasks = [];
  List<SubTask> subtasks = [];
  List<Task> completedTasks = [];

  void addTask(taskname, datetime) {
    tasks.add(
      Task(dateTime: datetime, taskName: taskname),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeStatus(task);
    completedTasks.add(task);
    deleteTask(task);
    notifyListeners();
  }

  void addSubTask(Task task, nameSub) {
    subtasks.add(SubTask(name_sub: nameSub));
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
