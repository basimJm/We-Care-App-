import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  // This is the key for the form widget
  final formKey = GlobalKey<FormState>();

  // This is the email controller for email textfield
  final email = TextEditingController();

  // This is the password controller for email textfield
  final password = TextEditingController();

  // Login function
  onLogin({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {}
  }
}
