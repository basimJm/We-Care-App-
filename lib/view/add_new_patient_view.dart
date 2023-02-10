import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/viewModel/add_new_patient_vm.dart';
import 'package:provider/provider.dart';

class AddNewPatientView extends StatelessWidget {
  const AddNewPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddNewPatientVM>(
      create: (context) => AddNewPatientVM(),
      child: Consumer<AddNewPatientVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add new patient'),
            ),
          );
        },
      ),
    );
  }
}
