import 'package:advanced2/core/helpers/font_syle_helper.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  // Dark Blue
  static TextStyle get font14DartBlueMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManager.darkBlue,
  );
  static TextStyle get font11DartBlueMedium => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManager.darkBlue,
  );
  static TextStyle get font11DartBlueReqular => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.darkBlue,
  );

  // Blue
  static TextStyle get font32BlueBold => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.mainBlue,
  );
  static TextStyle get font24BlueBold => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.mainBlue,
  );
  static TextStyle get font12BlueReqular => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.mainBlue,
  );
  static TextStyle get font11BlueSemiBold => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorManager.mainBlue,
  );

  //white
  static TextStyle get font16WhiteReqular => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );
  static TextStyle get font16WhiteSemiBold => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  // Gray
  static TextStyle get font14GrayReqular => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.gray,
  );
  static TextStyle get font14LightGrayReqular => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.lightGray,
  );
  static TextStyle get font13GrayReqular => TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.gray,
  );
  static TextStyle get font11GrayReqular => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.gray,
  );

  // Black
  static TextStyle get font24BlackBold => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
}
