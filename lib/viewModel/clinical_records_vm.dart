import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/models/clinical_records_model.dart';
import 'package:mapd722_group2_project/services/clnical_record_service.dart';

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

  Future<void> initialization({required String patientId}) async {
    setSelectedFilterIndex(0);
    ClincalRecordService.getClincalRecords(patientId: patientId).then((value) {
      _clinicalData = value;
      _clonedData = value;
      notifyListeners();
    }).catchError((err) {
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
