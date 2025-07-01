// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kakao_adfit_web/kakao_adfit_web.dart';

import 'package:example/main.dart';

void main() {
  group('Example App Tests', () {
    testWidgets('App should display AppBar with correct title',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that AppBar is present
      expect(find.byType(AppBar), findsOneWidget);

      // Verify that the title is correct
      expect(find.text('Kakao Adfit Example'), findsOneWidget);
    });

    testWidgets('App should display AdfitBannerWidget',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that AdfitBannerWidget is present
      expect(find.byType(AdfitBannerWidget), findsOneWidget);
    });

    testWidgets('App should have Scaffold structure',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify basic structure
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });
  });
}
