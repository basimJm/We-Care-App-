import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_group2_project/widgets/patient_list_critical_card.dart';

void main() {
  testWidgets('Test patient list critical card widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      MaterialApp(
        home: PatientListCriticalCard(
          firstName: 'Dicksen',
          lastName: 'Veloopillay',
          sex: 'M',
          dob: DateTime.parse('1995-07-31'),
          condition: 'Blood pressure high',
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('Dicksen Veloopillay'), findsOneWidget);
    expect(find.text('Blood pressure high'), findsOneWidget);
  });
}
