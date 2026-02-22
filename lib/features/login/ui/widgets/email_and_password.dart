import 'package:advanced2/core/helpers/app_regex.dart';
import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/widgets/app_text_form_field.dart';
import 'package:advanced2/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const EmailAndPassword({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinlength = false;

  late FocusNode passwordFocusNode;
  bool isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(_changeValidationState);

    passwordFocusNode = FocusNode();
    passwordFocusNode.addListener(_changeFocus);
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(_changeValidationState);
    passwordFocusNode.removeListener(_changeFocus);
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _changeValidationState() {
    final String password = widget.passwordController.text;
    setState(() {
      hasLowerCase = AppRegex.hasLowerCase(password);
      hasUpperCase = AppRegex.hasUpperCase(password);
      hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
      hasNumber = AppRegex.hasNumber(password);
      hasMinlength = AppRegex.hasMinLength(password);
    });
  }

  void _changeFocus() {
    setState(() {
      isPasswordFocused = passwordFocusNode.hasFocus;
    });
  }

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
            focusNode: passwordFocusNode,
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
              }
            },
          ),
          if (isPasswordFocused)
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: PasswordValidation(
                hasLowerCase: hasLowerCase,
                hasUpperCase: hasUpperCase,
                hasSpecialCharacter: hasSpecialCharacter,
                hasNumber: hasNumber,
                hasMinlength: hasMinlength,
              ),
            ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
