
import 'package:e_commerce_flutter/check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Checkbox Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyCheckboxWidget()));

    // Find the checkbox widget
    final checkboxFinder = find.byType(Checkbox);

    // Verify that the checkbox starts as unchecked
    expect(tester.widget<Checkbox>(checkboxFinder).value, false);

    // Tap the checkbox
    await tester.tap(checkboxFinder);
    await tester.pump();

    // Verify that the checkbox is checked after tapping
    expect(tester.widget<Checkbox>(checkboxFinder).value, true);
  });
}
