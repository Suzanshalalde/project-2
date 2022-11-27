class SubTask {
  String name_sub;
  bool taskDone;

  SubTask({required this.name_sub, this.taskDone = false});
  void changeStatus(SubTask task) {
    task.taskDone = !taskDone;
  }
}
