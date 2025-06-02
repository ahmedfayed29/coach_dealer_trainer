import 'package:coach/art_core/theme/widget_theme/app_bar_theme.dart';
import 'package:coach/art_core/theme/widget_theme/app_button_themes.dart';
import 'package:coach/art_core/theme/widget_theme/app_elevated_button_themes.dart';
import 'package:coach/art_core/theme/widget_theme/app_switch_themes.dart';
import 'package:coach/art_core/theme/widget_theme/card_theme.dart';
import 'package:coach/art_core/theme/widget_theme/text_field_themes.dart';
import 'package:coach/art_core/theme/widget_theme/text_theme.dart';

import '../art_core.dart';

class AppThemes {
  static ThemeData light = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primaryColor),
      appBarTheme: AppBarThemes.light,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      buttonTheme: AppButtonThemes.light,
      elevatedButtonTheme: AppElevatedButtonThemes.light,
      inputDecorationTheme: TextFieldThemes.light,
      switchTheme: AppSwitchThemes.light,
      cardTheme: CardThemes.light,
      textTheme: TextThemeApp.light,
      fontFamily: "Tajawal");
}
