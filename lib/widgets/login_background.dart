import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LoginBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/backgrounds/w_login_background.png",
            fit: BoxFit.fill,
          ),
        ),
        child,
      ],
    );
  }
}
