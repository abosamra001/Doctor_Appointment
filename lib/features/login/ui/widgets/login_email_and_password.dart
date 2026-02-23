import 'package:advanced2/core/helpers/app_regex.dart';
import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginEmailAndPassword extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginEmailAndPassword({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginEmailAndPassword> createState() => _LoginEmailAndPasswordState();
}

class _LoginEmailAndPasswordState extends State<LoginEmailAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: widget.emailController,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: widget.passwordController,
            hintText: 'Password',
            obscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                isObscureText = !isObscureText;
              }),
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.mainBlue,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              } else if (!AppRegex.hasMinLength(value)) {
                return 'Password must be at least 8 characters long';
              }
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
