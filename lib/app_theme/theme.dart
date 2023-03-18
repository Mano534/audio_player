import 'package:flutter/material.dart';

class AppTheme { 
  static createTheme(dynamic context) {
    final ThemeData appThemeData = ThemeData(
      primaryColor: Colors.blueAccent,
      fontFamily: 'Georgia',
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    );
    return appThemeData;
  }
  static final Color primaryColor = Colors.deepOrange.shade800;
    static final Color  secondaryColor =  Colors.deepOrange.shade200;
    static final Color formColor = Colors.grey.shade300;
    static Gradient appColor = LinearGradient(colors: [primaryColor,secondaryColor],begin: Alignment.topCenter,end: Alignment.bottomCenter);
  }

