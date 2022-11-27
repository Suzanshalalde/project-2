import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/task.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Screen/subtask.dart';
import 'package:flutter_application_22/Widget/completetask.dart';
import 'package:flutter_application_22/Widget/tasklist.dart';
import 'package:provider/provider.dart';

class Task_Page extends StatefulWidget {
  const Task_Page({
    super.key,
  });

  @override
  State<Task_Page> createState() => _Task_PageState();
}

class _Task_PageState extends State<Task_Page> {
  DateTime datetime = DateTime.now();
  String taskname = "";
  bool onChecked = false;

  void initState() {
    super.initState();
  }

  final List<Task> _tasks = <Task>[];
  final List<Task> _taskscomplete = <Task>[];

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("New Task:", textAlign: TextAlign.left),
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      taskname = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter your Task",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: datetime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return;
                        setState(() {
                          datetime = newDate;
                        });

                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                              hour: datetime.hour, minute: datetime.minute),
                        );
                        if (newTime == null) return;

                        final newDateTime = DateTime(
                            newDate.year,
                            newDate.month,
                            newDate.day,
                            newTime.hour,
                            newTime.minute);

                        setState(() {
                          datetime = newDateTime;
                        });
                      },
                      child: const Text(
                        'Select Date & Time',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                ],
              )),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Provider.of<Task_data>(context, listen: false).addTask(
                      taskname,
                      datetime,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Save",
                      style: TextStyle(color: Colors.blueGrey)),
                ),
                CupertinoDialogAction(
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text(
              "Index",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          drawer: Drawer(
            backgroundColor: const Color(0xFFEEEFF5),
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blueGrey),
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Stack(children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.dribbble.com/users/899296/screenshots/17086155/media/ab388e976dd78c8432ada54439e5f3cd.png?compress=1&resize=400x300"),
                        radius: 50.0,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Nidaa NasserEdin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.notifications,
                          size: 15,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.settings,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ]),
                ),
                ListTile(
                  title: const Text(
                    "Index",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 25),
                  ),
                  leading: const Icon(
                    Icons.inbox_rounded,
                    size: 25,
                    color: Color.fromARGB(255, 235, 70, 19),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Task_Page()));
                  },
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFEEEFF5),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35, bottom: 15),
                    child: const Text(
                      "Your Tasks",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                        offset: Offset(5.0, 5.0),
                      ),
                    ], borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const TaskList(),
                  ),
                ]),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 260, top: 12),
              ),
              Expanded(
                child: Stack(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35, bottom: 15),
                    child: const Text(
                      "Completed Tasks",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 120,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                        offset: Offset(5.0, 5.0),
                      ),
                    ], borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const CpmpletedTask(),
                  ),
                ]),
              ),
              Expanded(
                child: FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: createNewTask,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
