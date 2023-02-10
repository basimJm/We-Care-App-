import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';
import 'package:mapd722_group2_project/view/add_new_patient_view.dart';
import 'package:mapd722_group2_project/view/after_splash_view.dart';
import 'package:mapd722_group2_project/view/home_view.dart';
import 'package:mapd722_group2_project/view/login_view.dart';
import 'package:mapd722_group2_project/view/register_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesName.afterSplashRoute:
        return MaterialPageRoute(builder: (_) => const AfterSplashView());
      case RoutesName.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RoutesName.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesName.addNewPatientRoute:
        return MaterialPageRoute(builder: (_) => const AddNewPatientView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
