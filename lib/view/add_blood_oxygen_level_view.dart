import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';
import 'package:mapd722_group2_project/validators/validator_mixin.dart';
import 'package:mapd722_group2_project/viewModel/add_blood_oxygen_level_vm.dart';
import 'package:mapd722_group2_project/widgets/custom_button.dart';
import 'package:mapd722_group2_project/widgets/custom_text_form_field.dart';
import 'package:mapd722_group2_project/widgets/form_label.dart';
import 'package:mapd722_group2_project/widgets/form_spacer.dart';
import 'package:mapd722_group2_project/widgets/label_spacer.dart';
import 'package:provider/provider.dart';

class AddBloodOxygenLevelView extends StatelessWidget with ValidatorMixin {
  const AddBloodOxygenLevelView({
    super.key,
    required this.patientId,
  });

  final String patientId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBloodOxygenLevelVM>(
      create: (context) => AddBloodOxygenLevelVM(),
      child: Consumer<AddBloodOxygenLevelVM>(builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Blood Oxygen Level'),
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
                      label: 'Blood Oxygen Level',
                      isRequired: true,
                    ),
                    LabelSpacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomFormTextField(
                            controller: vm.percentage,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) => requiredValidation(
                                value, "Blood Oxygen Level is required"),
                            hint: 'Enter percentage',
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text('%'),
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
