import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/task_tile.dart';
import 'package:flutter_todo/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                  taskTitle: task.task,
                  isChecked: task.isDone,
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  });
            });
      },
    );
  }
}
