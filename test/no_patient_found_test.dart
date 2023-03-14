import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_group2_project/widgets/no_patient_found.dart';

void main() {
  testWidgets('Test No patient found widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      const MaterialApp(
        home: NoPatientFound(),
      ),
    );

    expect(find.text('No patient found'), findsOneWidget);
  });
}
