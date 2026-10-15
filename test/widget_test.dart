import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/screens/menu_screen.dart';
import 'package:sandwich_shop/screens/order_screen.dart';

void main() {
  group('OrderItemDisplay widget tests', () {
    testWidgets('displays zero sandwiches with no emoji', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: OrderItemDisplay(0, 'Footlong Sub')),
        ),
      );

      expect(find.text('0 Footlong Sub sandwich(es): '), findsOneWidget);
    });

    testWidgets('displays three sandwiches with three emojis', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: OrderItemDisplay(3, 'Footlong Sub')),
        ),
      );

      expect(find.text('3 Footlong Sub sandwich(es): 🥪🥪🥪'), findsOneWidget);
    });
  });

  group('App smoke tests', () {
    testWidgets('App displays MenuScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MenuScreen), findsOneWidget);
      expect(find.text('Sandwich Menu'), findsOneWidget);
    });

    testWidgets('Displays sandwich cards with names and prices', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const App());
      expect(find.text('Footlong Sub'), findsOneWidget);
      expect(find.text('£5.99'), findsOneWidget);
      expect(find.text('Six-Inch Sub'), findsOneWidget);
      expect(find.text('£4.50'), findsOneWidget);
      expect(find.text('Order'), findsNWidgets(2));
    });

    testWidgets(
      'Tapping Order navigates to OrderScreen with selected sandwich',
      (WidgetTester tester) async {
        await tester.pumpWidget(const App());

        await tester.tap(find.text('Order').first);
        await tester.pumpAndSettle();

        expect(find.byType(OrderScreen), findsOneWidget);
        expect(find.text('Order Footlong Sub'), findsOneWidget);
        expect(find.text('0 Footlong Sub Sandwich(es): '), findsOneWidget);
      },
    );

    testWidgets(
      'Tapping Order navigates to OrderScreen with selected sandwich',
      (WidgetTester tester) async {
        await tester.pumpWidget(const App());

        await tester.tap(find.text('Order').first);
        await tester.pumpAndSettle();

        expect(find.byType(OrderScreen), findsOneWidget);
        expect(find.text('Order Footlong Sub'), findsOneWidget);
        expect(find.text('0 Footlong Sub Sandwich(es): '), findsOneWidget);

        await tester.tap(find.text('Add'));
        await tester.pump();
        expect(find.text('1 Footlong Sub Sandwich(es): 🥪'), findsOneWidget);

        await tester.tap(find.text('Remove'));
        await tester.pump();
        expect(find.text('0 Footlong Sub Sandwich(es): '), findsOneWidget);
      },
    );
  });
}
