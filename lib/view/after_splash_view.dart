import 'package:flutter/material.dart';
import 'package:mapd722_group2_project/constants/route_name.dart';

class AfterSplashView extends StatefulWidget {
  const AfterSplashView({super.key});

  @override
  State<AfterSplashView> createState() => _AfterSplashViewState();
}

class _AfterSplashViewState extends State<AfterSplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, RoutesName.loginRoute);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "logo",
          child: Image.asset(
            "assets/logos/wecare_logo.png",
          ),
        ),
      ),
    );
  }
}
