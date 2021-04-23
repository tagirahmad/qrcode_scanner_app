import 'package:flutter/material.dart';

class AppColors {
  AppColors._internal();

  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  static const PRIMARY = Color(0xFF297DC3);
  static const PRIMARY_MATERIAL = MaterialColor(
    0xFF297DC3,
    {
      50: Color(0xFF297DC3),
      100: Color(0xFF297DC3),
      200: Color(0xFF297DC3),
      300: Color(0xFF297DC3),
      400: Color(0xFF297DC3),
      500: Color(0xFF297DC3),
      600: Color(0xFF297DC3),
      700: Color(0xFF297DC3),
      800: Color(0xFF297DC3),
      900: Color(0xFF297DC3),
    },
  );
}
