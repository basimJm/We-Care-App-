import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapd722_group2_project/services/patient_service.dart';
import 'package:mapd722_group2_project/widgets/error_dialog.dart';
import 'package:mapd722_group2_project/widgets/loading_overlay.dart';
import 'package:mapd722_group2_project/widgets/success_dialog.dart';

class AddNewPatientVM extends ChangeNotifier {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // This is the key for the form widget
  final formKey = GlobalKey<FormState>();
  // This is the email controller for email textfield
  final email = TextEditingController();
  // This is the first name controller for first name textfield
  final firstName = TextEditingController();
  // This is the last name controller for last name textfield
  final lastName = TextEditingController();
  // This is the address controller for address textfield
  final address = TextEditingController();
  // This is the mobile number controller for mobile number textfield
  final mobileNumber = TextEditingController();

  final dob = TextEditingController();

  String _selectedGender = "M";
  String get selectedGender => _selectedGender;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  setGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }

  Future selectDateOfBirth({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      _selectedDate = picked;
      dob.text = formatter.format(picked);
      print(dob.text);
      notifyListeners();
    }
  }

  onSubmit({required BuildContext context}) {
    if (dob.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Date of Birth is required"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
    if (formKey.currentState!.validate()) {
      // Map<String, String> data = {
      //   "firstName": firstName.text,
      //   "lastName": lastName.text,
      //   "email": email.text,
      //   "mobileNumber": mobileNumber.text,
      //   "address": address.text,
      //   "sex": _selectedGender,
      //   "dob": dob.text,
      // };
      LoadingOverlay.of(context).show();
      PatientService.createNewPatient(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        mobileNumber: mobileNumber.text,
        address: address.text,
        sex: _selectedGender,
        dob: dob.text,
      ).then((value) {
        LoadingOverlay.of(context).hide();
        SuccessDialogBox.successDialog(
          "Success",
          "Patient ${value.firstName} has been successfuly created.",
          context,
        ).then((value) {
          Navigator.pop(context);
        });
      }).catchError((err) {
        LoadingOverlay.of(context).hide();
        ErrorDialogBox.errorDialog("Error", err.toString(), context);
      });
    }
  }
}
