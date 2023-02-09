import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class FormLabel extends StatelessWidget {
  final String? label;
  final bool isRequired;
  final TextAlign alignment;
  final double labelFontSize;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  FormLabel({
    this.label,
    this.isRequired = false,
    this.alignment = TextAlign.start,
    this.labelFontSize = 15,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: alignment,
      text: TextSpan(
        text: '$label ',
        style: TextStyle(
          color: kTextColor,
          fontSize: labelFontSize,
        ),
        children: <TextSpan>[
          TextSpan(
            text: isRequired ? '*' : '',
            style: TextStyle(
              color: Colors.red,
              fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
