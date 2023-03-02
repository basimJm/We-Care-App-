import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapd722_group2_project/services/heart_beat_service.dart';
import 'package:mapd722_group2_project/widgets/error_dialog.dart';
import 'package:mapd722_group2_project/widgets/loading_overlay.dart';
import 'package:mapd722_group2_project/widgets/success_dialog.dart';

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
    if (formKey.currentState!.validate()) {
      LoadingOverlay.of(context).show();

      HeartBeatService.addHeartBeat(
        patientId: patientId,
        category: "Heart Beat Rate",
        date: dateTested.text,
        nurseName: nurseName.text,
        bpm: rate.text,
      ).then((value) {
        LoadingOverlay.of(context).hide();

        SuccessDialogBox.successDialog("Success",
                "Heart Beat Rate has been successfully created", context)
            .then((value) {
          Navigator.pop(context);
        });
      }).catchError((err) {
        LoadingOverlay.of(context).hide();
        ErrorDialogBox.errorDialog("Error", err.toString(), context);
      });
    }
  }
}
