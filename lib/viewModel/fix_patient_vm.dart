import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapd722_group2_project/services/fix_patient_service.dart';
import 'package:mapd722_group2_project/widgets/error_dialog.dart';
import 'package:mapd722_group2_project/widgets/loading_overlay.dart';
import 'package:mapd722_group2_project/widgets/success_dialog.dart';

class FixPatientVM extends ChangeNotifier {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // This is the key for the form widget
  final formKey = GlobalKey<FormState>();

  final dateTested = TextEditingController();

  final nurseName = TextEditingController();
  final systolic = TextEditingController();
  final diastolic = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  Future selectDateOfBirth({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      _selectedDate = picked;
      dateTested.text = formatter.format(picked);
      if (kDebugMode) {
        print(dateTested.text);
      }

      notifyListeners();
    }
  }

  onSubmit({
    required BuildContext context,
    required String patientId,
    required String testId,
  }) {
    if (formKey.currentState!.validate()) {
      int sys = int.parse(systolic.text);
      int dia = int.parse(diastolic.text);

      if (sys < 70 || dia < 60) {
        ErrorDialogBox.errorDialog(
            'Error',
            'In order to fix this patient, he/she must have a normal systolic and diastolic value.',
            context);
      } else if (sys > 120 || dia > 80) {
        ErrorDialogBox.errorDialog(
            'Error',
            'In order to fix this patient, he/she must have a normal systolic and diastolic value.',
            context);
      } else {
        LoadingOverlay.of(context).show();
        FixPatientService.fixPatient(
                patientId: patientId,
                testId: testId,
                category: 'Blood Pressure',
                date: dateTested.text,
                nurseName: nurseName.text,
                systolic: sys,
                diastolic: dia)
            .then((value) {
          LoadingOverlay.of(context).hide();

          SuccessDialogBox.successDialog(
            'Success',
            'This patient has been fixed',
            context,
          ).then((value) {
            Navigator.pop(context);
          });
        }).catchError((err) {
          LoadingOverlay.of(context).hide();

          ErrorDialogBox.errorDialog(
            'Error',
            err.toString(),
            context,
          );
        });
      }
    }
  }
}
