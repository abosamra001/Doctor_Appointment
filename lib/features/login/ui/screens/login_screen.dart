import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/app_text_button.dart';
import 'package:advanced2/core/widgets/screen_wrapper.dart';
import 'package:advanced2/features/login/data/models/login_request_body.dart';
import 'package:advanced2/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced2/features/login/ui/widgets/dont_have_an_account_text.dart';
import 'package:advanced2/features/login/ui/widgets/login_email_and_password.dart';
import 'package:advanced2/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:advanced2/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: LoginBlocListener(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(40),
                    Text("Welcome Back", style: AppTextStyles.font24BlueBold),
                    verticalSpace(10),
                    Text(
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                      style: AppTextStyles.font14GrayReqular,
                    ),
                    verticalSpace(36),
                    Column(
                      children: [
                        LoginEmailAndPassword(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: AppTextStyles.font12BlueReqular,
                            ),
                          ),
                        ),
                        verticalSpace(40),
                        AppTextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().emitLoginState(
                                LoginRequestBody(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          text: 'Login',
                        ),
                        verticalSpace(24),
                        const TermsAndConditionsText(),
                        verticalSpace(16),
                        const DontHaveAnAccountText(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
