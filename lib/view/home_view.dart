import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapd722_group2_project/viewModel/home_vm.dart';
import 'package:mapd722_group2_project/widgets/arrow_circle.dart';
import 'package:mapd722_group2_project/widgets/label_spacer.dart';
import 'package:mapd722_group2_project/widgets/no_patient_found.dart';
import 'package:mapd722_group2_project/widgets/patient_list_card.dart';
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
                        : RefreshIndicator(
                            onRefresh: vm.initialization,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 100.0),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: vm.patientData.length,
                                      itemBuilder: (context, index) {
                                        return PatientListCard(
                                          onPressed: () {},
                                          firstName:
                                              vm.patientData[index].firstName!,
                                          lastName:
                                              vm.patientData[index].lastName!,
                                          sex: vm.patientData[index].sex!,
                                          dob: vm
                                              .patientData[index].dateOfBirth!,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
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
