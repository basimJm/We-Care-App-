import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';
import 'package:mapd722_group2_project/validators/validator_mixin.dart';
import 'package:mapd722_group2_project/viewModel/general_information_vm.dart';
import 'package:mapd722_group2_project/widgets/custom_button.dart';
import 'package:mapd722_group2_project/widgets/custom_text_form_field.dart';
import 'package:mapd722_group2_project/widgets/form_label.dart';
import 'package:mapd722_group2_project/widgets/form_spacer.dart';
import 'package:mapd722_group2_project/widgets/label_spacer.dart';
import 'package:mapd722_group2_project/widgets/retry_fetch.dart';
import 'package:provider/provider.dart';

class GeneralInformationView extends StatefulWidget {
  const GeneralInformationView({
    super.key,
    required this.patientId,
  });

  final String patientId;

  @override
  State<GeneralInformationView> createState() => _GeneralInformationViewState();
}

class _GeneralInformationViewState extends State<GeneralInformationView>
    with ValidatorMixin {
  GeneralInformationVM vm = GeneralInformationVM();

  @override
  void initState() {
    vm.initialization(patientId: widget.patientId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GeneralInformationVM>(
      create: (context) => vm,
      child: Consumer<GeneralInformationVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("View / Update patient basic info"),
            ),
            body: vm.generalInformationStates ==
                    GeneralInformationStates.isLoading
                ? const Center(child: CircularProgressIndicator())
                : vm.generalInformationStates ==
                        GeneralInformationStates.hasError
                    ? Center(
                        child: RetryFetch(
                          errorMessage: vm.errorMessage,
                          onPressed: vm.initialization,
                        ),
                      )
                    : SingleChildScrollView(
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
                                  validator: (value) => requiredValidation(
                                      value, "First name is required"),
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
                                  validator: (value) => requiredValidation(
                                      value, "Last name is required"),
                                  hint: 'Enter last name',
                                  prefixIcon: const Icon(FontAwesomeIcons.user),
                                ),
                                FormSpacer(),
                                FormLabel(
                                  label: 'Address',
                                  isRequired: true,
                                ),
                                LabelSpacer(),
                                CustomFormTextField(
                                  controller: vm.address,
                                  validator: (value) => requiredValidation(
                                      value, "Address is required"),
                                  hint: 'Enter address',
                                  prefixIcon:
                                      const Icon(FontAwesomeIcons.addressBook),
                                ),
                                FormSpacer(),
                                FormLabel(
                                  label: 'Mobile number',
                                  isRequired: true,
                                ),
                                LabelSpacer(),
                                CustomFormTextField(
                                  controller: vm.mobileNumber,
                                  validator: (value) => requiredValidation(
                                      value, "Mobile number is required"),
                                  hint: 'Enter mobile number',
                                  prefixIcon:
                                      const Icon(FontAwesomeIcons.phone),
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
                                  label: 'Gender',
                                  isRequired: false,
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: "M",
                                      groupValue: vm.selectedGender,
                                      onChanged: (value) {
                                        vm.setGender(value!);
                                      },
                                    ),
                                    const Text("Male"),
                                    Radio(
                                      value: "F",
                                      groupValue: vm.selectedGender,
                                      onChanged: (value) {
                                        vm.setGender(value!);
                                      },
                                    ),
                                    const Text("Female")
                                  ],
                                ),
                                FormSpacer(),
                                FormLabel(
                                  label: 'Date of Birth',
                                  isRequired: true,
                                ),
                                LabelSpacer(),
                                GestureDetector(
                                  onTap: () {
                                    vm.selectDateOfBirth(context: context);
                                  },
                                  child: CustomFormTextField(
                                    enabled: false,
                                    prefixIcon: const Icon(
                                      Icons.calendar_month,
                                      size: 20,
                                    ),
                                    controller: vm.dob,
                                    validator: (value) => requiredValidation(
                                        value, "Date of Birth is required"),
                                    hint: 'Select date',
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
                                        vm.onSubmit(
                                          context: context,
                                          patientId: widget.patientId,
                                        );
                                      },
                                      title: 'Submit',
                                      backgroundColor: kButtonColor,
                                    ),
                                  ),
                                ),
                              ],
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
