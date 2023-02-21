import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/models/clinical_records_model.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class ClinicalCard extends StatelessWidget {
  const ClinicalCard({
    super.key,
    required this.data,
    required this.onPressed,
  });

  final ClinicalRecordsModel data;
  final VoidCallback onPressed;

  String generateValue(String category, Readings readings) {
    switch (category) {
      case "Blood Pressure":
        return "Value: ${readings.systolic.toString()} / ${readings.diastolic.toString()} mm/Hg";
      case "Heart Beat Rate":
        return "Value: ${readings.bpm.toString()} bpm";
      case "Blood Oxygen Level":
        return "Value: ${readings.percentage.toString()} %";
      case "Respiratory rate":
        return "Value: ${readings.bpm.toString()} bpm";
      default:
        return "No value";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.all(0.0),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.category!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF5E5E5E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Nurse: ${data.nurseName}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      generateValue(data.category!, data.readings!),
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                data.date.toString(),
                style: const TextStyle(
                  fontSize: 15.0,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
