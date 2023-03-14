import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_group2_project/widgets/patient_list_card.dart';

void main() {
  testWidgets('Test patient list card widget', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(
      MaterialApp(
        home: PatientListCard(
          firstName: 'Dicksen',
          lastName: 'Veloopillay',
          sex: 'M',
          dob: DateTime.parse('1995-07-31'),
          onPressed: () {},
        ),
      ),
    );
  });
}
