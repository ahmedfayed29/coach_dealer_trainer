import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../art_core.dart';

class AppTextField extends StatefulWidget {
  final bool? readOnly;
  final int? maxLines;
  final String? label;
  final String? hint;
  final TextStyle? hintStyle;
  final bool isSelectable;

  final bool darkOrAuth;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  final String? errorText;
  final Color? borderColor;
  final Color? labelColor;

  final bool isPassword;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  final int? maxLength;

  final VoidCallback? onTap;

  final String? initialText;

  final double contentPaddingVertical;

  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final bool? filled;
  final bool? enableBorder;

  const AppTextField({
    Key? key,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.hint,
    this.label,
    this.textInputType,
    this.hintColor,
    this.suffixIcon,
    this.prefixIcon,
    this.darkOrAuth = false,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.errorText,
    this.initialText,
    this.borderColor,
    this.hintStyle,
    this.isSelectable = false,
    this.controller,
    this.maxLength,
    this.contentPaddingVertical = 15,
    this.fillColor,
    this.filled,
    this.labelColor,
    this.enableBorder = true,
    this.textColor,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          AppText(
            text: widget.label!,
            fontSize: 16.h,
            height: 2.25,
          ),
        TextFormField(
          controller: widget.controller,
          autofocus: false,
          validator: widget.validator,
          onTap: widget.onTap ?? () {},
          initialValue: widget.initialText,
          enabled: true,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly ?? false,
          maxLines: widget.maxLines,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword == true ? obscureText : false,
          maxLength: widget.maxLength,
          style: TextStyle(
            color: widget.textColor ?? AppColors.textSecondary,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: widget.filled,
              border: widget.enableBorder == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16))
                  : Theme.of(context).inputDecorationTheme.border?.copyWith(
                      borderSide:
                          BorderSide(color: widget.borderColor ?? AppColors.secondaryColor)),
              disabledBorder: widget.enableBorder == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16))
                  : Theme.of(context).inputDecorationTheme.disabledBorder?.copyWith(
                      borderSide:
                          BorderSide(color: widget.borderColor ?? AppColors.secondaryColor)),
              enabledBorder: widget.enableBorder == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16))
                  : Theme.of(context)
                      .inputDecorationTheme
                      .enabledBorder
                      ?.copyWith(borderSide: BorderSide(color: widget.borderColor ?? Colors.grey)),
              focusedBorder: widget.enableBorder == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16))
                  : Theme.of(context).inputDecorationTheme.focusedBorder?.copyWith(
                      borderSide:
                          BorderSide(color: widget.borderColor ?? AppColors.secondaryColor)),
              focusedErrorBorder: widget.enableBorder == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16))
                  : Theme.of(context).inputDecorationTheme.focusedErrorBorder,
              errorBorder: widget.enableBorder == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16))
                  : Theme.of(context).inputDecorationTheme.errorBorder,
              contentPadding:
                  EdgeInsets.symmetric(vertical: widget.contentPaddingVertical, horizontal: 8),
              hintText: widget.hint,
              // hintStyle: TextStyle(
              //   color: widget.hintColor ?? AppColors.secondaryColor,
              //   fontWeight: FontWeight.w100,
              //   fontSize: 15,
              // ),
              alignLabelWithHint: true,
              // labelStyle: TextStyle(
              //   color: widget.labelColor ?? AppColors.secondaryColor,
              //   fontWeight: FontWeight.w500,
              //   fontSize: 16,
              // ),
              errorText:
                  widget.errorText == null || widget.errorText!.isEmpty || widget.errorText == ''
                      ? null
                      : widget.errorText,
              errorMaxLines: 3,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ??
                  (widget.isPassword
                      ? InkWell(
                          onTap: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            !obscureText ? "assets/icons/hidden.svg" : "assets/icons/hidden.svg",
                            height: 25,
                            width: 25,
                            color: AppColors.secondaryColor,
                          ).paddingSymmetric(horizontal: 15))
                      : widget.isSelectable
                          ? const Icon(
                              CupertinoIcons.chevron_down,
                              size: 15,
                            )
                          : const SizedBox())),
        ),
      ],
    );
  }
}
