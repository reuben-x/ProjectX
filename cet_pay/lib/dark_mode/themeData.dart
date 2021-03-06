import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(
          title: TextStyle(color: isDarkTheme ? Colors.white : Colors.black)),
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      backgroundColor: isDarkTheme ? Colors.white : Color(0xff212121),
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xff212121) : Colors.white,
      canvasColor: isDarkTheme ? Color(0xCC1A1A) : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      bottomNavigationBarTheme:
          Theme.of(context).bottomNavigationBarTheme.copyWith(
                unselectedIconTheme: IconThemeData(
                  color: isDarkTheme ? Colors.white : Colors.black,
                ),
                unselectedLabelStyle: TextStyle(
                  color: isDarkTheme ? Colors.white : Colors.grey,
                ),
                unselectedItemColor: isDarkTheme ? Colors.white : Colors.black,
              ),
    );
  }
}
