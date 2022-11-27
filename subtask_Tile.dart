import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_22/Moduels/subtask.dart';

class SubTask_Tile extends StatelessWidget {
  final void Function(bool?) checkboxChange;
  final SubTask subTask;
  const SubTask_Tile(
      {super.key, required this.checkboxChange, required this.subTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        subTask.name_sub,
        style: TextStyle(
            decoration: subTask.taskDone
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      leading: Checkbox(
        onChanged: checkboxChange,
        value: subTask.taskDone,
      ),
    );
  }
}
