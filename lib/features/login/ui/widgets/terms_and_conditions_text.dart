import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our  ',
            style: AppTextStyles.font11GrayReqular,
          ),
          TextSpan(
            text: 'Terms & Conditions  ',
            style: AppTextStyles.font11DartBlueMedium,
          ),
          TextSpan(text: 'and ', style: AppTextStyles.font11GrayReqular),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: AppTextStyles.font11DartBlueMedium.copyWith(height: 1.5.h),
          ),
        ],
      ),
    );
  }
}
