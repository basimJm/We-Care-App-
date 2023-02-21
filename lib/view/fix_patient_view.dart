import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';
import 'package:mapd722_group2_project/validators/validator_mixin.dart';
import 'package:mapd722_group2_project/viewModel/add_blood_pressure_vm.dart';
import 'package:mapd722_group2_project/viewModel/fix_patient_vm.dart';
import 'package:mapd722_group2_project/widgets/custom_button.dart';
import 'package:mapd722_group2_project/widgets/custom_text_form_field.dart';
import 'package:mapd722_group2_project/widgets/form_label.dart';
import 'package:mapd722_group2_project/widgets/form_spacer.dart';
import 'package:mapd722_group2_project/widgets/label_spacer.dart';
import 'package:provider/provider.dart';

class FixPatientView extends StatelessWidget with ValidatorMixin {
  const FixPatientView({
    super.key,
    required this.patientId,
    required this.testId,
  });

  final String patientId;
  final String testId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FixPatientVM>(
      create: (context) => FixPatientVM(),
      child: Consumer<FixPatientVM>(builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Fix this patient\'s blood pressure'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: vm.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormLabel(
                      label: 'Date tested',
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
                        controller: vm.dateTested,
                        validator: (value) => requiredValidation(
                            value, "Date tested is required"),
                        hint: 'Select date tested',
                      ),
                    ),
                    FormSpacer(),
                    FormLabel(
                      label: 'Nurse name',
                      isRequired: true,
                    ),
                    LabelSpacer(),
                    CustomFormTextField(
                      controller: vm.nurseName,
                      validator: (value) =>
                          requiredValidation(value, "Nurse name is required"),
                      hint: 'Enter nurse name',
                    ),
                    FormSpacer(),
                    FormLabel(
                      label: 'Blood Pressure',
                      isRequired: true,
                    ),
                    LabelSpacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomFormTextField(
                            controller: vm.systolic,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) => requiredValidation(
                                value, "Systolic value is required"),
                            hint: 'Systolic',
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text('/'),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: CustomFormTextField(
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            controller: vm.diastolic,
                            validator: (value) => requiredValidation(
                                value, "Diastolic value is required"),
                            hint: 'Diastolic',
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Expanded(child: Text('mmHg')),
                      ],
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
                            vm.onSubmit(context: context, patientId: patientId);
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
      }),
    );
  }
}
