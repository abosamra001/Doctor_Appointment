import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/app_text_button.dart';
import 'package:advanced2/features/login/data/models/login_request_body.dart';
import 'package:advanced2/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced2/features/login/ui/widgets/already_have_an_account_text.dart';
import 'package:advanced2/features/login/ui/widgets/email_and_password.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginBlocListener(
      child: Scaffold(
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
                  Column(
                    children: [
                      EmailAndPassword(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
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
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(20),
                      const AlreadyHaveAnAccountText(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
