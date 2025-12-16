import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final String hintText; // required
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextStyle? inputTextStyle;
  final Color? backgroundColor;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusBorder,
    this.enabledBorder,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.obscureText,
    this.inputTextStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: backgroundColor ?? ColorManager.moreLightGray,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: ColorManager.mainBlue, width: 1.3),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: ColorManager.lighterGray, width: 1.3),
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayReqular,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DartBlueMedium,
    );
  }
}
