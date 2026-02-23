import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final String initialCountryCode;
  const PhoneNumberField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.controller,
    required this.initialCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: initialCountryCode,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: ColorManager.moreLightGray,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: getBorder(ColorManager.mainBlue),
        enabledBorder: getBorder(ColorManager.lighterGray),
        errorBorder: getBorder(ColorManager.red),
        focusedErrorBorder: getBorder(ColorManager.red),
        hintText: hintText,
        hintStyle: TextStyles.font14LightGrayReqular,
      ),
    );
  }

  OutlineInputBorder getBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0.r),
    borderSide: BorderSide(color: color, width: 1.3),
  );
}
