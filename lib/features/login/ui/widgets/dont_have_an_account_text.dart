import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Text(
            'Don\'t have an account yet?  ',
            style: AppTextStyles.font11DartBlueReqular,
          ),
          GestureDetector(
            onTap: () => context.pushReplacementNamed(Routes.signupScreen),
            child: Text('Sign Up', style: AppTextStyles.font11BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
