import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Screen/subtask.dart';
import 'package:flutter_application_22/Widget/ListTile_.dart';
import 'package:provider/provider.dart';

import '../Moduels/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late final void Function(bool?) checkboxChange;
  late final Task taskModel;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Task_data>(
      builder: (context, TaskData, child) {
        List<Task> _t = TaskData.tasks;
        return ListView.builder(
            itemCount: _t.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ListTile_Task(
                  task: _t[index],
                  checkboxChange: (isChecked) {
                    TaskData.updateTask(_t[index]);
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SubTask_Screen(
                            task: _t[index],
                          )));
                },
              );
            });
      },
    );
  }
}
