import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        cardColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        cardColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Colors.purple,
        ),
      );
}
