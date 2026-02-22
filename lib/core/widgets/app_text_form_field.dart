import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextStyle? inputTextStyle;
  final Color? backgroundColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String?) validator;
  final FocusNode? focusNode;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    required this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.obscureText,
    this.inputTextStyle,
    this.backgroundColor,
    this.textInputType,
    this.controller,
    required this.validator,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: backgroundColor ?? ColorManager.moreLightGray,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusBorder ?? getBorder(ColorManager.mainBlue),
        enabledBorder: enabledBorder ?? getBorder(ColorManager.lighterGray),
        errorBorder: errorBorder ?? getBorder(ColorManager.red),
        focusedErrorBorder: focusedErrorBorder ?? getBorder(ColorManager.red),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayReqular,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DartBlueMedium,
      keyboardType: textInputType,
      validator: (value) => validator(value),
    );
  }

  OutlineInputBorder getBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0.r),
    borderSide: BorderSide(color: color, width: 1.3),
  );
}
