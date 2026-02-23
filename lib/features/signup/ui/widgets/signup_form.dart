import 'package:advanced2/core/helpers/app_regex.dart';
import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/widgets/app_text_form_field.dart';
import 'package:advanced2/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey formKey;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.passwordConfirmationController,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // Password validation
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
            controller: widget.nameController,
            hintText: 'Name',
            textInputType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 3) {
                return 'Please enter a valid name';
              }
            },
          ),
          verticalSpace(18),
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
            controller: widget.phoneNumberController,
            hintText: 'Phone number',
            textInputType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: widget.passwordController,
            hintText: 'Password',
            textInputType: TextInputType.visiblePassword,
            focusNode: passwordFocusNode,
            validator: (value) {
              if (value == null || value.isEmpty || !checkPassword()) {
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
          verticalSpace(18),
          AppTextFormField(
            controller: widget.passwordConfirmationController,
            hintText: 'Password Confirmation',
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              } else if (value != widget.passwordController.text) {
                return 'Password doesn\'t match';
              }
            },
          ),
        ],
      ),
    );
  }

  bool checkPassword() =>
      hasLowerCase &&
      hasUpperCase &&
      hasMinlength &&
      hasNumber &&
      hasSpecialCharacter;

  @override
  void dispose() {
    widget.passwordController.removeListener(_changeValidationState);
    passwordFocusNode.removeListener(_changeFocus);
    passwordFocusNode.dispose();
    super.dispose();
  }
}
