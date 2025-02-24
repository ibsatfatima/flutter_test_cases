import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cases/task_screen.dart';

void main() {
  testWidgets('Adding a task updates the UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskScreen()));

    expect(find.text('Enter task'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'New Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('New Task'), findsOneWidget);
  });

  testWidgets('Marking a task as complete', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TaskScreen()));

    await tester.enterText(find.byType(TextField), 'Test Task');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(find.text('Test Task'), findsOneWidget);
  });
}
