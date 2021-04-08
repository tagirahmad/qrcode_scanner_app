import 'package:flutter/material.dart';

class AppColors {
  AppColors._internal();

  static final AppColors _singleton = AppColors._internal();

  factory AppColors() {
    return _singleton;
  }

  static const PRIMARY = Color(0xFF297DC3);
}
