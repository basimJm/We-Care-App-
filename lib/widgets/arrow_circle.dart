import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

// ignore: use_key_in_widget_constructors
class ArrowCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            kButtonColor,
            kButtonColor,
          ],
        ),
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        size: 12,
        color: Colors.white,
      ),
    );
  }
}
