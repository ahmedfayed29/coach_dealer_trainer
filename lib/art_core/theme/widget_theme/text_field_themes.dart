// import 'package:intercome_app/core/theme/themes.dart';

import '../themes.dart';

class TextFieldThemes {
  static const double _radius = 10;
  static const double _width1_5 = 1;

  static InputDecorationTheme light = InputDecorationTheme(
    fillColor: AppColors.white,
    filled: true,
    // enabled border style
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

    // focused border style
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),

    // error border style
    errorBorder: OutlineInputBorder(
        // borderSide: BorderSide(color: AppColors.purple, width: _width1_5),
        borderSide: BorderSide(color: Colors.red, width: _width1_5),
        borderRadius: BorderRadius.all(Radius.circular(_radius))),

    // focused Error border style
    focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: _width1_5), borderRadius: BorderRadius.all(Radius.circular(_radius))),
    labelStyle: TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.normal,
    ),
    hintStyle: TextStyle(
      color: AppColors.textSecondary,
      fontWeight: FontWeight.normal,
    ),
    contentPadding: const EdgeInsets.all(8),
    // prefixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
  );
}
