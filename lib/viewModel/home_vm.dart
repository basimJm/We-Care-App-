import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';
import 'package:mapd722_group2_project/models/patient_list_model.dart';
import 'package:mapd722_group2_project/services/patient_service.dart';

enum PatientStates { isLoaded, hasError, isLoading, isEmpty }

class HomeVM extends ChangeNotifier {
  List<PatientListModel> _patientData = [];
  List<PatientListModel> get patientData => _patientData;

  List<PatientListModel> _clonedData = [];
  List<PatientListModel> get clonedData => _clonedData;

  PatientStates? _patientStates;
  PatientStates? get patientStates => _patientStates;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  setPatientStates(PatientStates state) {
    _patientStates = state;
    notifyListeners();
  }

  initialization() {
    setPatientStates(PatientStates.isLoading);
    PatientService.getPatientLists().then((value) {
      if (value.isNotEmpty) {
        _patientData = value;
        _clonedData = value;
        setPatientStates(PatientStates.isEmpty);
      } else {
        setPatientStates(PatientStates.isEmpty);
      }
    }).catchError((err) {
      _errorMessage = err.toString();
      setPatientStates(PatientStates.hasError);
    });
  }

  onLogout({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout ?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.loginRoute,
                  (route) => false,
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
