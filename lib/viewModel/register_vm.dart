import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/services/register_service.dart';
import 'package:mapd722_group2_project/widgets/error_dialog.dart';
import 'package:mapd722_group2_project/widgets/loading_overlay.dart';
import 'package:mapd722_group2_project/widgets/success_dialog.dart';

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
    if (formKey.currentState!.validate()) {
      LoadingOverlay.of(context).show();

      RegisterService.register(
              firstName: firstName.text,
              lastName: lastName.text,
              email: email.text,
              password: confirmPassword.text)
          .then((value) {
        LoadingOverlay.of(context).hide();
        SuccessDialogBox.successDialog("Success",
                "Your account has been successfully created", context)
            .then((value) {
          Navigator.pop(context);
        });
      }).catchError((err) {
        LoadingOverlay.of(context).hide();
        ErrorDialogBox.errorDialog("Error", err.toString(), context);
      });
    }
  }
}
