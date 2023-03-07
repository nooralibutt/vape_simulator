import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFF1e1c26);
  static const Color accent = Color(0xFF2c75fd);
  static const Color kAppbarColor = Colors.orange;

  static ThemeData buildTheme() {
    final baseData =
        ThemeData(fontFamily: 'MachineFont', brightness: Brightness.dark);
    return baseData.copyWith(
      primaryColor: primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
