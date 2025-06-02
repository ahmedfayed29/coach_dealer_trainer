import 'package:auto_size_text/auto_size_text.dart';

import '../../theme/themes.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final Color? color;

  final FontWeight? fontWeight;
  final int? maxLines;

  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  final TextOverflow? textOverflow;

  const AppText(
      {super.key,
      required this.text,
      this.fontSize,
      this.height,
      this.color,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.fontFamily,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? AppColors.textPrimary,
        fontWeight: fontWeight ?? FontWeight.w700,
        height: height ?? 1,
        fontFamily: fontFamily ?? "Tajawal",
        decoration: textDecoration,
      ),
      overflow: textOverflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
