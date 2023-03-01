import 'package:flutter/foundation.dart';
import 'package:mapd722_group2_project/models/clinical_records_model.dart';
import 'package:mapd722_group2_project/services/clnical_record_service.dart';

enum ClinicalRecordsStates { isLoaded, hasError, isLoading, isEmpty }

class ClinicalRecordsVM extends ChangeNotifier {
  int _selectedFilterIndex = 0;
  int get selectedFilterIndex => _selectedFilterIndex;

  setSelectedFilterIndex(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }

  List<ClinicalRecordsModel> _clinicalData = [];
  List<ClinicalRecordsModel> get clinicalData => _clinicalData;

  List<ClinicalRecordsModel> _clonedData = [];
  List<ClinicalRecordsModel> get clonedData => _clonedData;

  ClinicalRecordsStates? _clinicalRecordsStates;
  ClinicalRecordsStates? get clinicalRecordsStates => _clinicalRecordsStates;

  setClinicalRecordsStates(ClinicalRecordsStates state) {
    _clinicalRecordsStates = state;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> initialization({required String patientId}) async {
    setSelectedFilterIndex(0);
    setClinicalRecordsStates(ClinicalRecordsStates.isLoading);
    ClincalRecordService.getClincalRecords(patientId: patientId).then((value) {
      if (value.isEmpty) {
        setClinicalRecordsStates(ClinicalRecordsStates.isEmpty);
      } else {
        setClinicalRecordsStates(ClinicalRecordsStates.isLoaded);
        _clinicalData = value;
        _clonedData = value;
        notifyListeners();
      }
    }).catchError((err) {
      _errorMessage = err.toString();
      setClinicalRecordsStates(ClinicalRecordsStates.hasError);
      if (kDebugMode) {
        print(err);
      }
    });
  }

  filterTickets(String value) {
    _clinicalData =
        _clonedData.where((element) => element.category == value).toList();
    notifyListeners();
  }
}
