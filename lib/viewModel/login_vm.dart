import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';
import 'package:mapd722_group2_project/services/login_service.dart';
import 'package:mapd722_group2_project/widgets/error_dialog.dart';
import 'package:mapd722_group2_project/widgets/loading_overlay.dart';

class LoginVM extends ChangeNotifier {
  // This is the key for the form widget
  final formKey = GlobalKey<FormState>();

  // This is the email controller for email textfield
  final email = TextEditingController();

  // This is the password controller for email textfield
  final password = TextEditingController();

  // Login function
  onLogin({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      LoadingOverlay.of(context).show();

      LoginService.login(email: email.text, password: password.text)
          .then((value) {
        LoadingOverlay.of(context).hide();
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.homeRoute,
          (route) => false,
        );
      }).catchError((err) {
        LoadingOverlay.of(context).hide();
        ErrorDialogBox.errorDialog('Error', err.toString(), context);
      });
    }
  }
}
