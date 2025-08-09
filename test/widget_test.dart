// test/widget_test.dart
import 'package:flutter/material.dart';
// Import the app from the main.dart file.
// Make sure your main.dart file has a library name or adjust the import.
import 'package:evana_taxi/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MainScreen builds and BottomNavigationBar works correctly',
          (WidgetTester tester) async {

        // Build our app and trigger a frame.
        await tester.pumpWidget(const EvanaApp());

        // --- Verify the initial state (Home screen is active) ---

        // Verify that the Home, Activity, and Account icons are present.
        expect(find.byIcon(Icons.home_filled), findsOneWidget);
        expect(find.byIcon(Icons.receipt_long), findsOneWidget);
        expect(find.byIcon(Icons.person), findsOneWidget);

        // Verify that the HomeScreen placeholder text is visible.
        expect(find.text('Home Screen (Map will be here)'), findsOneWidget);
        // Verify that other screens are not visible.
        expect(find.text('Activity Screen (Ride History)'), findsNothing);
        expect(find.text('Account Screen (Profile & Favorites)'), findsNothing);

        // --- Simulate a tap on the 'Activity' tab and verify the state change ---

        // Find the 'Activity' icon and tap it.
        await tester.tap(find.byIcon(Icons.receipt_long));
        // Rebuild the widget after the state has changed.
        await tester.pump();

        // Verify that the ActivityScreen placeholder text is now visible.
        expect(find.text('Activity Screen (Ride History)'), findsOneWidget);
        // Verify that the HomeScreen is no longer visible.
        expect(find.text('Home Screen (Map will be here)'), findsNothing);

        // --- Simulate a tap on the 'Account' tab and verify the state change ---

        // Find the 'Account' icon and tap it.
        await tester.tap(find.byIcon(Icons.person));
        await tester.pump();

        // Verify that the AccountScreen placeholder text is now visible.
        expect(find.text('Account Screen (Profile & Favorites)'), findsOneWidget);
        // Verify that the ActivityScreen is no longer visible.
        expect(find.text('Activity Screen (Ride History)'), findsNothing);
      });

  testWidgets('AppBar and Drawer are present on HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const EvanaApp());

    // Verify the AppBar title is present
    expect(find.text('Evana'), findsOneWidget);

    // Find the menu icon to open the drawer
    final menuIcon = find.byIcon(Icons.menu);
    expect(menuIcon, findsOneWidget);

    // Tap the menu icon to open the drawer
    await tester.tap(menuIcon);
    await tester.pumpAndSettle(); // pumpAndSettle waits for animations to finish

    // Verify the drawer is open by finding content within it
    expect(find.text('Evana Menu'), findsOneWidget);
    expect(find.text('Support / Help'), findsOneWidget);
  });
}