// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exo1/main.dart';

void main() {
  // Note: find.widgetWithText(ElevatedButton, 'Add person') would not work here.
  // It only check for direct class and ElevatedButton relies on a factory and sub-classes
  final addButtonFinder = find.ancestor(
    of: find.text('Add person'),
    matching: find.byWidgetPredicate((widget) => widget is ElevatedButton),
  );
  final inputTextFinder = find.byType(TextField);

  testWidgets('Default users are loaded on start', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.text("Dilbert"), findsOneWidget);
    expect(find.text("Alice"), findsOneWidget);
    expect(find.text("Wally"), findsOneWidget);
  });

  testWidgets('Add button is disabled until some text is entered',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(addButtonFinder, findsOneWidget);
    expect(inputTextFinder, findsOneWidget);

    expect(tester.widget<ElevatedButton>(addButtonFinder).enabled, isFalse);

    await tester.enterText(inputTextFinder, 'Someone');
    await tester.pump();

    expect(tester.widget<ElevatedButton>(addButtonFinder).enabled, isTrue);
  });

  testWidgets('Clicking the add button will add the user to the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.enterText(inputTextFinder, 'Someone A');
    await tester.pump();
    await tester.tap(addButtonFinder);
    await tester.pump();

    // The input field should be empty, and the person added to the list
    expect(tester.widget<TextField>(inputTextFinder).controller!.text, isEmpty);
    expect(find.text("Someone A"), findsOneWidget);
  });

  testWidgets('Clicking enter in the textfield will add the user to the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.enterText(inputTextFinder, 'Someone B');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // The input field should be empty, and the person added to the list
    expect(tester.widget<TextField>(inputTextFinder).controller!.text, isEmpty);
    expect(find.text("Someone B"), findsOneWidget);
  });

  testWidgets('A user can be removed with a swipe',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    final userFinder = find.widgetWithText(Dismissible, 'Dilbert');

    expect(userFinder, findsOneWidget);

    // Swipe Dilbert and wait for the animation to settle
    await tester.drag(userFinder, Offset(500, 0));
    await tester.pumpAndSettle();

    // Check Dilbert was removed
    expect(userFinder, findsNothing);
  });
}
