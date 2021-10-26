import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_project/models/task.dart';
import 'package:todo_list_project/screens/add_task_screen.dart';
import 'package:todo_list_project/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: 'Read A boo'),
    Task(name: 'Play FIFA'),
    Task(name: 'Programming'),
  ];

  Widget builButtomSheet(BuildContext context) {
    return AddTaskScreen((newTaskTitle) {
      setState(() {
        tasks.add(Task(name: newTaskTitle));
      });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: builButtomSheet,
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10.0, left: 30, right: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TODOLIST',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${tasks.length} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (tasks.length >= 1) {
                      tasks.removeAt(tasks.length - 1);
                    }
                  });
                },
                child: Text(
                  'Delete',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TasksList(tasks),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
