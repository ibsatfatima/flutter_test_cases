import 'package:flutter/material.dart';
import 'package:flutter_test_cases/task_controller.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskController _taskController = TaskController();
  final TextEditingController _textController = TextEditingController();

  void _addTask() {
    setState(() {
      _taskController.addTask(_textController.text);
      _textController.clear();
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _taskController.toggleTaskCompletion(index);
    });
  }

  void _removeTask(int index) {
    setState(() {
      _taskController.removeTask(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-Do List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(hintText: "Enter task",),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.teal, size: 35,),
                  onPressed: _addTask,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = _taskController.tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isCompleted,
                    activeColor: Colors.teal,
                    onChanged: (_) => _toggleTask(index),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.teal),
                    onPressed: () => _removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
