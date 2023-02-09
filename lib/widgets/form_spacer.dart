import 'package:flutter/material.dart';

class FormSpacer extends StatelessWidget {
  final double? height;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  FormSpacer({this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20.0,
    );
  }
}
