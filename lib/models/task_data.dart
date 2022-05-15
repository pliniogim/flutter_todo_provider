import 'package:flutter/foundation.dart'; //light then material.dart
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  //_tasks to prevent using the old constructor of<..>.tasks.add(...
  final List<Task> _tasks = [
    Task(task: 'New task...'),
  ];

  //public version
  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(task: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
      task.toggleDone();
      notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
