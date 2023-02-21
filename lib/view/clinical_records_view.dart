import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/themes/app_theme.dart';
import 'package:mapd722_group2_project/view/add_blood_oxygen_level_view.dart';
import 'package:mapd722_group2_project/view/add_blood_pressure_view.dart';
import 'package:mapd722_group2_project/view/add_heart_beat_rate_view.dart';
import 'package:mapd722_group2_project/view/add_respiratory_rate_view.dart';
import 'package:mapd722_group2_project/viewModel/clinical_records_vm.dart';
import 'package:mapd722_group2_project/widgets/clinical_card.dart';
import 'package:mapd722_group2_project/widgets/modal_card.dart';
import 'package:provider/provider.dart';

class ClinicalRecordsView extends StatefulWidget {
  const ClinicalRecordsView({
    super.key,
    required this.patientId,
    required this.patientName,
  });

  final String patientName;
  final String patientId;

  @override
  State<ClinicalRecordsView> createState() => _ClinicalRecordsViewState();
}

class _ClinicalRecordsViewState extends State<ClinicalRecordsView> {
  ClinicalRecordsVM vm = ClinicalRecordsVM();

  @override
  void initState() {
    vm.initialization(patientId: widget.patientId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClinicalRecordsVM>(
      create: (context) => vm,
      child: Consumer<ClinicalRecordsVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${widget.patientName} clinical records"),
            ),
            body: RefreshIndicator(
              onRefresh: () => vm.initialization(patientId: widget.patientId),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                vm.setSelectedFilterIndex(0);
                                vm.initialization(patientId: widget.patientId);
                              },
                              child: Chip(
                                label: Text(
                                  'All',
                                  style: TextStyle(
                                    color: vm.selectedFilterIndex == 0
                                        ? Colors.white
                                        : kButtonColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                side: BorderSide(
                                  color: vm.selectedFilterIndex == 0
                                      ? Colors.transparent
                                      : kButtonColor,
                                  width: 1.0,
                                ),
                                backgroundColor: vm.selectedFilterIndex == 0
                                    ? kButtonColor
                                    : Colors.transparent,
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                vm.setSelectedFilterIndex(1);
                                vm.filterTickets("Blood Pressure");
                              },
                              child: Chip(
                                label: Text(
                                  'Blood pressure',
                                  style: TextStyle(
                                    color: vm.selectedFilterIndex == 1
                                        ? Colors.white
                                        : kButtonColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                side: BorderSide(
                                  color: vm.selectedFilterIndex == 1
                                      ? Colors.transparent
                                      : kButtonColor,
                                  width: 1.0,
                                ),
                                backgroundColor: vm.selectedFilterIndex == 1
                                    ? kButtonColor
                                    : Colors.transparent,
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                vm.setSelectedFilterIndex(2);
                                vm.filterTickets("Heart Beat Rate");
                              },
                              child: Chip(
                                label: Text(
                                  'Heart Beat Rate',
                                  style: TextStyle(
                                    color: vm.selectedFilterIndex == 2
                                        ? Colors.white
                                        : kButtonColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                side: BorderSide(
                                  color: vm.selectedFilterIndex == 2
                                      ? Colors.transparent
                                      : kButtonColor,
                                  width: 1.0,
                                ),
                                backgroundColor: vm.selectedFilterIndex == 2
                                    ? kButtonColor
                                    : Colors.transparent,
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                vm.setSelectedFilterIndex(3);
                                vm.filterTickets("Blood Oxygen Level");
                              },
                              child: Chip(
                                label: Text(
                                  'Blood Oxygen Level',
                                  style: TextStyle(
                                    color: vm.selectedFilterIndex == 3
                                        ? Colors.white
                                        : kButtonColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                side: BorderSide(
                                  color: vm.selectedFilterIndex == 3
                                      ? Colors.transparent
                                      : kButtonColor,
                                  width: 1.0,
                                ),
                                backgroundColor: vm.selectedFilterIndex == 3
                                    ? kButtonColor
                                    : Colors.transparent,
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                vm.setSelectedFilterIndex(4);
                                vm.filterTickets("Respiratory rate");
                              },
                              child: Chip(
                                label: Text(
                                  'Respiratory rate',
                                  style: TextStyle(
                                    color: vm.selectedFilterIndex == 4
                                        ? Colors.white
                                        : kButtonColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                side: BorderSide(
                                  color: vm.selectedFilterIndex == 4
                                      ? Colors.transparent
                                      : kButtonColor,
                                  width: 1.0,
                                ),
                                backgroundColor: vm.selectedFilterIndex == 4
                                    ? kButtonColor
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.only(
                          bottom: 100,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: vm.clinicalData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: ClinicalCard(
                              onPressed: () {},
                              data: vm.clinicalData[index],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                        top: 12.0,
                        bottom: 30.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              color: const Color(
                                0xFFA3A3A3,
                              ),
                              height: 2,
                              width: 100.0,
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ModalCard(
                            imageAsset: "assets/icons/test_tube.png",
                            title: "Blood Pressure test",
                            subtitle: "Add",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddBloodPressureView(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((value) {
                                Navigator.pop(context);
                                vm.initialization(
                                  patientId: widget.patientId,
                                );
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ModalCard(
                            imageAsset: "assets/icons/test_tube.png",
                            title: "Respiratory Rate test",
                            subtitle: "Add",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddRespiratoryRateView(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((value) {
                                Navigator.pop(context);
                                vm.initialization(
                                  patientId: widget.patientId,
                                );
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ModalCard(
                            imageAsset: "assets/icons/test_tube.png",
                            title: "Blood Oxygen Level test",
                            subtitle: "Add",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddBloodOxygenLevelView(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((value) {
                                Navigator.pop(context);
                                vm.initialization(
                                  patientId: widget.patientId,
                                );
                              });
                            },
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          ModalCard(
                            imageAsset: "assets/icons/test_tube.png",
                            title: "Heart Beat Rate test",
                            subtitle: "Add",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddHeartBeatRateView(
                                    patientId: widget.patientId,
                                  ),
                                ),
                              ).then((value) {
                                Navigator.pop(context);
                                vm.initialization(
                                  patientId: widget.patientId,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
