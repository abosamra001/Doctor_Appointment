import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? buttonWidth;
  final double? buttonHeight;
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.buttonWidth,
    this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? ColorManager.mainBlue,
        ),
        padding: WidgetStatePropertyAll(
          padding ?? EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? 327.w, buttonHeight?.h ?? 52.h),
        ),
      ),
      child: Text(text, style: textStyle ?? AppTextStyles.font16WhiteSemiBold),
    );
  }
}
