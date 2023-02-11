import 'package:flutter/material.dart';

// App icon color
const Color kIconColor = Colors.white;
const Color kPrimaryColor = Color(0xFF2E9B95);
const Color kTextColor = Colors.black;
const Color kHomeBottomBarColor = Color(0xFF962E3A);
const Color kTabBarBackgroundColor = Color.fromARGB(255, 165, 24, 24);

const Color kButtonColor = Color(0xFF2A948E);

// Setup App global theme
ThemeData appTheme = ThemeData(
    // app scaffold background color
    scaffoldBackgroundColor: Colors.white,
    toggleableActiveColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      primary: kPrimaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kButtonColor,
    ),
    // appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none));
