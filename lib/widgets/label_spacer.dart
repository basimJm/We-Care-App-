import 'package:flutter/material.dart';

class LabelSpacer extends StatelessWidget {
  final double? height;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LabelSpacer({this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10.0,
    );
  }
}
