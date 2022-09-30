import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:order_widget/order_widget.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  testWidgets('Test orders status', (WidgetTester tester) async {
    await tester.pumpWidget(OrderStatus(Size(100, 100)));

    expect(find.text('Orders status'), findsAtLeastNWidgets(1));
    expect(find.text('9'), findsNothing);

  });
}
