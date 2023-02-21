import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddHeartBeatRateVM extends ChangeNotifier {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // This is the key for the form widget
  final formKey = GlobalKey<FormState>();

  final dateTested = TextEditingController();

  final nurseName = TextEditingController();
  final rate = TextEditingController();

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

  onSubmit({required BuildContext context, required String patientId}) {
    if (formKey.currentState!.validate()) {}
  }
}
