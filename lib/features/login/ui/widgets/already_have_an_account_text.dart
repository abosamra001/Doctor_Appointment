import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account yet? ',
            style: TextStyles.font11DartBlueReqular,
          ),
          TextSpan(text: 'Sign Up', style: TextStyles.font11BlueSemiBold),
        ],
      ),
    );
  }
}
