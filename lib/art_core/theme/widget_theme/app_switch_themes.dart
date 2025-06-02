import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppSwitchThemes {
  static SwitchThemeData light = SwitchThemeData(
    trackColor: MaterialStateProperty.resolveWith((states) {
      return AppColors.primaryColor;
    }),
    thumbColor: MaterialStateProperty.resolveWith((states) {
      return AppColors.primaryColor;
    }),
  );
}
