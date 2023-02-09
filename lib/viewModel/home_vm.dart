import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';

class HomeVM extends ChangeNotifier {
  onLogout({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout ?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.loginRoute,
                  (route) => false,
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
