import 'package:flutter_test_cases/task_model.dart';

class TaskController {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title) {
    if (title.isNotEmpty) {
      _tasks.add(Task(title: title));
    }
  }

  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
    }
  }

  void toggleTaskCompletion(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].toggleCompletion();
    }
  }
}
