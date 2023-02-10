import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';
import 'package:mapd722_group2_project/models/patient_critical_model.dart';
import 'package:mapd722_group2_project/models/patient_list_model.dart';
import 'package:mapd722_group2_project/services/patient_service.dart';

enum PatientStates { isLoaded, hasError, isLoading, isEmpty }

class HomeVM extends ChangeNotifier {
  int _selectedFilterIndex = 0;
  int get selectedFilterIndex => _selectedFilterIndex;

  bool _showClear = false;
  bool get showClear => _showClear;

  setShowClear(bool value) {
    _showClear = value;
    notifyListeners();
  }

  searchListener() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setShowClear(false);
      } else {
        setShowClear(true);
      }

      if (_selectedFilterIndex == 0) {
        _patientData = _clonedData
            .where((element) => element.firstName!
                .toLowerCase()
                .trim()
                .contains(searchController.text.toLowerCase().trim()))
            .toList();
        notifyListeners();
      } else if (_selectedFilterIndex == 1) {
        _patientCriticalData = _clonedCriticalData
            .where((element) => element.firstName!
                .toLowerCase()
                .trim()
                .contains(searchController.text.toLowerCase().trim()))
            .toList();
        notifyListeners();
      }
    });
  }

  final searchController = TextEditingController();

  setSelectedFilterIndex(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }

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

  List<PatientCriticalModel> _patientCriticalData = [];
  List<PatientCriticalModel> get patientCriticalData => _patientCriticalData;

  List<PatientCriticalModel> _clonedCriticalData = [];
  List<PatientCriticalModel> get clonedCriticalData => _clonedCriticalData;

  Future<void> initialization() async {
    setPatientStates(PatientStates.isLoading);

    if (selectedFilterIndex == 0) {
      PatientService.getPatientLists().then((value) {
        if (value.isNotEmpty) {
          _patientData = value;
          _clonedData = value;
          setPatientStates(PatientStates.isLoaded);
        } else {
          setPatientStates(PatientStates.isEmpty);
        }
      }).catchError((err) {
        _errorMessage = err.toString();
        setPatientStates(PatientStates.hasError);
      });
    } else {
      PatientService.getPatientsWithCriticalConditions().then((value) {
        if (value.isNotEmpty) {
          _patientCriticalData = value;
          _clonedCriticalData = value;
          setPatientStates(PatientStates.isLoaded);
        } else {
          setPatientStates(PatientStates.isEmpty);
        }
      }).catchError((err) {
        _errorMessage = err.toString();
        setPatientStates(PatientStates.hasError);
      });
    }
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
