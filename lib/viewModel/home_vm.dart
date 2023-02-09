import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';

class HomeVM extends ChangeNotifier {
  onLogout({required BuildContext context}) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.loginRoute,
      (route) => false,
    );
  }
}
