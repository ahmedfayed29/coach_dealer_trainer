import '../themes.dart';

class TextThemeApp {
  static TextTheme light = TextTheme(
    bodyMedium: _styleLight,
    labelMedium: _styleLight,
    headlineMedium: _styleLight,
    headlineLarge: _styleLight,
  );

  static final TextStyle _styleLight = TextStyle(
    color: AppColors.primaryColor,
    // color: AppColors.secondaryColor,
    overflow: TextOverflow.ellipsis,
    fontSize: _fontSizeText(),
    // fontWeight: FontWeight.w500,
  );

  static double _fontSizeText() {
    double size = 14;
    return size;
  }
}
