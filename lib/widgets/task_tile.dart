import 'package:flutter/material.dart';
import 'package:todo_list_project/screens/tasks_screen.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            fontSize: 20),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isChecked,
        onChanged: (newValue) {
          checkboxCallback(newValue);
        },
      ),
    );
  }
}
