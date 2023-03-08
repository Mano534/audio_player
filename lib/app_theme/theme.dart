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
}
