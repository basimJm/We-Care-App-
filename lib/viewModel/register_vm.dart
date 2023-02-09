import 'package:flutter/material.dart';

class RegisterVM extends ChangeNotifier {
  // This is the key for the form widget
  final formKey = GlobalKey<FormState>();
  // This is the email controller for email textfield
  final email = TextEditingController();
  // This is the password controller for password textfield
  final password = TextEditingController();
  // This is the first name controller for first name textfield
  final firstName = TextEditingController();
  // This is the last name controller for last name textfield
  final lastName = TextEditingController();
  // This is the confirm password controller for confirm password textfield
  final confirmPassword = TextEditingController();

  void registerUser({
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {}
  }
}
