// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:todo_app_flutter/widgets/listcounter.dart';

// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: ListCounter('Hai', 'Available', Colors.blue, Icons.check));
//   }
// }

// void main() {
//   testWidgets('test ListCounter widget', (WidgetTester tester) async {
//     await tester.pumpWidget(TestWidget());

//     final textFinder = find.text('Hai');
//     final iconFinder = find.text('Available');

//     expect(textFinder, findsOneWidget);
//     expect(iconFinder, findsOneWidget);
//   });
  
// }

void main() {
  testWidgets('test remove Todo', (WidgetTester tester) async {
    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
    await tester.pumpAndSettle();

    final textFinder = find.text('Tugas ke-1');

    expect(textFinder, findsNothing);
  }
  );
}