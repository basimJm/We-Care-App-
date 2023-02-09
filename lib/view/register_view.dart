import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';
import 'package:mapd722_group2_project/validators/validator_mixin.dart';
import 'package:mapd722_group2_project/viewModel/register_vm.dart';
import 'package:mapd722_group2_project/widgets/custom_button.dart';
import 'package:mapd722_group2_project/widgets/custom_text_form_field.dart';
import 'package:mapd722_group2_project/widgets/form_label.dart';
import 'package:mapd722_group2_project/widgets/form_spacer.dart';
import 'package:mapd722_group2_project/widgets/label_spacer.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with ValidatorMixin {
  RegisterVM vm = RegisterVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
      ),
      body: ChangeNotifierProvider<RegisterVM>(
        create: (context) => vm,
        child: Consumer<RegisterVM>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: vm.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormLabel(
                        label: 'First name',
                        isRequired: true,
                      ),
                      LabelSpacer(),
                      CustomFormTextField(
                        controller: vm.firstName,
                        validator: (value) =>
                            requiredValidation(value, "First name is required"),
                        hint: 'Enter first name',
                        prefixIcon: const Icon(FontAwesomeIcons.user),
                      ),
                      FormSpacer(),
                      FormLabel(
                        label: 'Last name',
                        isRequired: true,
                      ),
                      LabelSpacer(),
                      CustomFormTextField(
                        controller: vm.lastName,
                        validator: (value) =>
                            requiredValidation(value, "Last name is required"),
                        hint: 'Enter last name',
                        prefixIcon: const Icon(FontAwesomeIcons.user),
                      ),
                      FormSpacer(),
                      FormLabel(
                        label: 'Email',
                        isRequired: true,
                      ),
                      LabelSpacer(),
                      CustomFormTextField(
                        controller: vm.email,
                        validator: (value) => emailValidation(value),
                        hint: 'Enter email',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                      ),
                      FormSpacer(),
                      FormLabel(
                        label: 'Password',
                        isRequired: true,
                      ),
                      LabelSpacer(),
                      CustomFormTextField(
                        controller: vm.password,
                        validator: (value) => passwordValidation(value),
                        hint: 'Enter password',
                        obscureText: true,
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          size: 20,
                        ),
                      ),
                      FormSpacer(),
                      FormLabel(
                        label: 'Confirm password',
                        isRequired: true,
                      ),
                      LabelSpacer(),
                      CustomFormTextField(
                        controller: vm.confirmPassword,
                        validator: (value) =>
                            passwordMatch(value, vm.password.text),
                        hint: 'Confirm password',
                        obscureText: true,
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          size: 20,
                        ),
                      ),
                      FormSpacer(
                        height: 40.0,
                      ),
                      SafeArea(
                        top: false,
                        bottom: true,
                        left: false,
                        right: false,
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            onTap: () {
                              vm.registerUser(context: context);
                            },
                            title: 'Create',
                            backgroundColor: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
