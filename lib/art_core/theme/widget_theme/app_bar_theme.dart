import 'package:flutter/services.dart';

import '../themes.dart';

class AppBarThemes {
  static AppBarTheme light = AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    centerTitle: false,
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: 20,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.textPrimary,
      size: 24,
    ),
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );
}
