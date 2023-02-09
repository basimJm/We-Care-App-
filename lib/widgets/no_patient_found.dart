import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class NoPatientFound extends StatelessWidget {
  const NoPatientFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/icons/empty_icon.png"),
        const Text(
          'Np patient found',
          style: TextStyle(
            color: kTextColor,
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}
