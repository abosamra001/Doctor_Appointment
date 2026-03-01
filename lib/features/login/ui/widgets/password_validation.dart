import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinlength;

  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinlength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2.h),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2.h),
        buildValidationRow('At least 1 special character', hasSpecialCharacter),
        verticalSpace(2.h),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2.h),
        buildValidationRow('At least 8 characters long', hasMinlength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool isValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: isValidated
              ? ColorManager.green
              : ColorManager.darkBlue,
        ),
        horizontalSpace(6.w),
        Text(
          text,
          style: AppTextStyles.font13DartBlueReqular.copyWith(
            decoration: isValidated ? TextDecoration.lineThrough : null,
            decorationColor: ColorManager.green,
            decorationThickness: 2,
            color: isValidated ? ColorManager.gray : ColorManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
