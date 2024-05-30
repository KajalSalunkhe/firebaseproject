import 'package:flutter/material.dart';

class AppColors {
  static const Color appbarColor = Color(0xFF398BA6);
  static const Color primaryColor = Color(0xff6b9dfc);
  static const Color scaffoldBackgroundColor = Color(0xFF010F29);
  static const Color greyColor = Color(0xFF011D30);
  static const Color blackColor = Color(0xff1a1d26);
  static const Color darkPrimary = Color(0xFF009972);
  static const Color blue = Color(0xFF344E99);
}

class Constants {
  final linearGradientBlue = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xFF398BA6), Color(0xFF398BA6)],
      stops: [0.0, 1.0]);
  final linearGradientPurple = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xFF398BA6), Color(0xFF398BA6)],
      stops: [0.0, 1.0]);
}
