import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';
import 'package:mapd722_group2_project/validators/validator_mixin.dart';
import 'package:mapd722_group2_project/viewModel/login_vm.dart';
import 'package:mapd722_group2_project/widgets/custom_button.dart';
import 'package:mapd722_group2_project/widgets/custom_text_form_field.dart';
import 'package:mapd722_group2_project/widgets/form_label.dart';
import 'package:mapd722_group2_project/widgets/form_spacer.dart';
import 'package:mapd722_group2_project/widgets/label_spacer.dart';
import 'package:mapd722_group2_project/widgets/login_background.dart';
import 'package:mapd722_group2_project/widgets/secondary_button.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget with ValidatorMixin {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginVM>(
      create: (context) => LoginVM(),
      child: Consumer<LoginVM>(
        builder: (context, vm, child) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/backgrounds/w_login_background.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 80.0, left: 12.0, right: 12.0, bottom: 12.0),
                    child: Form(
                      key: vm.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Hero(
                                  tag: "logo",
                                  child: Image.asset(
                                      "assets/logos/wecare_logo.png"))),
                          FormSpacer(
                            height: 40.0,
                          ),
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
                          FormSpacer(
                            height: 40.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                                onTap: () {
                                  vm.onLogin(context: context);
                                },
                                title: 'Login',
                                backgroundColor: kButtonColor),
                          ),
                          FormSpacer(
                            height: 40.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: SecondaryButton(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.registerRoute,
                                );
                              },
                              title: 'Create account',
                              backgroundColor: kButtonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
