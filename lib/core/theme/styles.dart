import 'package:advanced2/core/theme/colors.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get font24Black700Weight =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle get fonst32BlueBold =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: ColorManager.primaryBlue);
  static TextStyle get font12GrayReqular =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorManager.gray);
  static TextStyle get font16GrayReqular => TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
}
