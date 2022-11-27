import 'package:flutter/material.dart';

import 'package:flutter_application_22/Moduels/task.dart';

class SubTask_Screen extends StatefulWidget {
  final Task task;
  const SubTask_Screen({super.key, required this.task});

  @override
  State<SubTask_Screen> createState() => _SubTask_ScreenState();
}

class _SubTask_ScreenState extends State<SubTask_Screen> {
  String nameSub = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            widget.task.taskName,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   height: 85,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       TextField(
            //         onChanged: ((value) {
            //           nameSub = value;
            //         }),
            //         // decoration: const InputDecoration(
            //         //   border: OutlineInputBorder(),
            //         //   labelText: 'Sub Task',
            //         //   hintText: 'Add Sub Task of your task',
            //         // ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
