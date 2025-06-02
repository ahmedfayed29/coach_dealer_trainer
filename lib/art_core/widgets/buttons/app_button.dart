import 'package:coach/art_core/widgets/text/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? loading;
  final bool? dark;
  final Color? color;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;

  final bool? enableBorder;
  final double? horizontalPadding;

  final bool visible;
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
    this.dark = false,
    this.color,
    this.textColor,
    this.enableBorder = false,
    this.width,
    this.height,
    this.visible = true,
    this.horizontalPadding,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return visible == false
        ? const SizedBox()
        : loading == true
            ? _loading()
            : _button();
  }

  final double _radius = 10.0;

  final double _marginHorizontal = 0.0;

  BoxDecoration _decoration() {
    if (color != null) {
      return BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(color: enableBorder == true ? AppColors.primaryColor : color!));
    } else {
      return BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(_radius),
          border: Border.all(color: AppColors.primaryColor));
    }
  }

  Widget _loading() {
    return Container(
      alignment: Alignment.center,
      width: width ?? double.maxFinite,
      height: height ?? 58,
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding ?? _marginHorizontal),
      decoration: _decoration(),
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: height ?? 50.h,
        margin: EdgeInsets.symmetric(horizontal: horizontalPadding ?? _marginHorizontal),
        decoration: _decoration(),
        child: AppText(
          text: title,
          fontSize: fontSize ?? 16.h,
          color: textColor ?? AppColors.white,
          fontWeight: fontWeight ?? FontWeight.w700,
        ),
      ),
    );
  }
}
