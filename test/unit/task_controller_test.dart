import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cases/task_controller.dart';

void main() {
  late TaskController taskController;

  setUp(() {
    taskController = TaskController();
  });

  test('Adding a task increases the list size', () {
    taskController.addTask("Buy milk");
    expect(taskController.tasks.length, 1);
  });

  test('Removing a task decreases the list size', () {
    taskController.addTask("Buy milk");
    taskController.removeTask(0);
    expect(taskController.tasks.isEmpty, true);
  });

  test('Toggling task completion updates its state', () {
    taskController.addTask("Buy milk");
    taskController.toggleTaskCompletion(0);
    expect(taskController.tasks[0].isCompleted, true);
  });
}
