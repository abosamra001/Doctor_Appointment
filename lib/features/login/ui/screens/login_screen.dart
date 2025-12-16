import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/app_text_button.dart';
import 'package:advanced2/core/widgets/app_text_form_field.dart';
import 'package:advanced2/features/login/ui/widgets/already_have_an_account_text.dart';
import 'package:advanced2/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayReqular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AppTextFormField(hintText: 'Email'),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Password',
                        obscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() {
                            isObscureText = !isObscureText;
                          }),
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ColorManager.mainBlue,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: GestureDetector(
                          onTap: () {
                            /** TODO: Create the right logic */
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyles.font12BlueReqular,
                          ),
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(onPressed: () {}, text: 'Login'),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(20),
                      const AlreadyHaveAnAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
