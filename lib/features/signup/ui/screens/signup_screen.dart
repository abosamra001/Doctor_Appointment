import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/app_text_button.dart';
import 'package:advanced2/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:advanced2/features/signup/data/models/signup_request_body.dart';
import 'package:advanced2/features/signup/logic/cubit/signup_cubit.dart';
import 'package:advanced2/features/signup/ui/widgets/already_have_an_account_text.dart';
import 'package:advanced2/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:advanced2/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SignupBlocListener(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  verticalSpace(40),
                  Text('Create Account', style: TextStyles.font24BlueBold),
                  verticalSpace(10),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: TextStyles.font14GrayReqular,
                  ),
                  verticalSpace(36),
                  Column(
                    children: [
                      SignUpForm(
                        formKey: formKey,
                        nameController: nameController,
                        emailController: emailController,
                        phoneNumberController: phoneNumberController,
                        passwordController: passwordController,
                        passwordConfirmationController:
                            passwordConfirmationController,
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignupCubit>().emitSignupState(
                              SignupRequestBody(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneNumberController.text,
                                gender: '0',
                                password: passwordController.text,
                                passwordConfirmation:
                                    passwordConfirmationController.text,
                              ),
                            );
                          }
                        },
                        text: 'Create Account',
                      ),
                      verticalSpace(24),
                      const TermsAndConditionsText(),
                      verticalSpace(16),
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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }
}
