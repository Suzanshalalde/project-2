import 'package:flutter/material.dart';
import 'package:flutter_application_22/Moduels/task_data.dart';
import 'package:flutter_application_22/Screen/settings.dart';
import 'package:flutter_application_22/Screen/tasks_page.dart';
import 'package:flutter_application_22/Screen/todaytask.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Task_data(),
      child: const MaterialApp(
        title: 'Planner Task',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomSheet: Flexible(
              child: SizedBox(
                height: 45,
                child: TabBar(
                    labelColor: Colors.blueGrey,
                    indicatorColor: Colors.blueAccent,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.check_box),
                      ),
                      Tab(
                        icon: Icon(Icons.calendar_today),
                      ),
                      Tab(
                        icon: Icon(Icons.settings),
                      ),
                    ]),
              ),
            ),
            body: TabBarView(children: [
              Task_Page(),
              TodayTask(),
              Setting(),
            ]),
          ),
        ),
      ),
    );
  }
}
