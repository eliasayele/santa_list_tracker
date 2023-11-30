// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santas_list_tracker/presentation/bloc/santas_list_bloc.dart';
import 'package:santas_list_tracker/presentation/screens/santa_list_screen.dart';

void main() {
  // testWidgets('SantasListScreen widget test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider(
  //         create: (context) => SantasListBloc()..add(SantasListInitialEvent()),
  //         child: SantasListScreen(),
  //       ),
  //     ),
  //   );
  //   // Wait for the widget tree to settle.
  //   await tester.pumpAndSettle();
  //   // Verify that the loaded state displays the ListView
  //   expect(find.byType(ListView), findsOneWidget);
  //
  //   // Tap the 'Add New Kid' button
  //   await tester.tap(find.byType(FloatingActionButton));
  //   await tester.pump();
  //
  //   // Fill in the text fields
  //   await tester.enterText(find.byType(TextField).first, 'Mykhailo Mudryk');
  //   await tester.enterText(find.byType(TextField).last, 'Enzo Fernández');
  //
  //   // Tap the 'Add' button in the dialog
  //   await tester.tap(find.text('Add'));
  //   await tester.pump();
  //
  //   // Verify that the new child is added
  //   expect(find.text('Mykhailo Mudryk'), findsOneWidget);
  // });
}
