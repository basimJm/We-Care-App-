import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/viewModel/home_vm.dart';
import 'package:mapd722_group2_project/widgets/no_patient_found.dart';
import 'package:mapd722_group2_project/widgets/retry_fetch.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeVM vm = HomeVM();

  @override
  void initState() {
    vm.initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (context) => vm,
      child: Consumer<HomeVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Patients"),
              actions: [
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == "logout") {
                      vm.onLogout(context: context);
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return const [
                      PopupMenuItem(
                        value: 'logout',
                        child: Text("Logout"),
                      ),
                    ];
                  },
                )
              ],
            ),
            body: vm.patientStates == PatientStates.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : vm.patientStates == PatientStates.hasError
                    ? Center(
                        child: RetryFetch(
                          errorMessage: vm.errorMessage,
                          onPressed: vm.initialization,
                        ),
                      )
                    : vm.patientStates == PatientStates.isEmpty
                        ? const Center(
                            child: NoPatientFound(),
                          )
                        : Column(
                            children: [],
                          ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
