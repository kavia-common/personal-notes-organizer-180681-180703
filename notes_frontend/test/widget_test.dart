import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/main.dart';

void main() {
  testWidgets('App renders placeholder content', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // AppBar title updated to 'Personal Notes'
    expect(find.text('Personal Notes'), findsOneWidget);
    expect(find.text('notes_frontend App is being generated...'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
