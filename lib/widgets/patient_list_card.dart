import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapd722_group2_project/utils/my_utils.dart';
import 'package:mapd722_group2_project/widgets/arrow_circle.dart';

class PatientListCard extends StatelessWidget {
  const PatientListCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.sex,
    required this.dob,
    required this.onPressed,
  });

  final String firstName;
  final String lastName;
  final String sex;
  final DateTime dob;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        margin: const EdgeInsets.only(
          left: 0.0,
          right: 0.0,
          top: 0.0,
          bottom: 15.0,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFEAEAEA),
                child: Icon(
                  FontAwesomeIcons.user,
                  textDirection: TextDirection.ltr,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstName $lastName",
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "${sex == 'M' ? 'Male' : 'Female'}, ${MyUtils.calculateAge(dob)} years old",
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ],
                ),
              ),
              ArrowCircle()
            ],
          ),
        ),
      ),
    );
  }
}
