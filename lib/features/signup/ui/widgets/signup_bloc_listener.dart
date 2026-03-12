import 'package:advanced2/core/helpers/app_dialogs.dart';
import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/features/signup/logic/cubit/signup_cubit.dart';
import 'package:advanced2/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  final Widget child;
  const SignupBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () => AppDialogs.showLoadingIndicator(context),
          signupSuccess: (signupResponse) {
            context.pop();
            AppDialogs.showSuccessStateDialog(
              context,
              message:
                  'Congratulations your account has created successfully! \nplease login to continue.',
              onPressed: () {
                context.pop();
                context.pushReplacementNamed(Routes.loginScreen);
              },
            );
          },
          signupError: (apiErrorModel) {
            context.pop();
            AppDialogs.showErrorStateDialog(
              context,
              apiErrorModel: apiErrorModel,
            );
          },
        );
      },
      child: child,
    );
  }

  List<String> parseValidationErrors(dynamic data) {
    List<String> subErrors = [];
    if (data is Map<String, dynamic>) {
      data.forEach((key, values) {
        if (values is List && values.isNotEmpty) {
          for (var value in values) {
            subErrors.add(value.toString());
          }
        }
      });
    }
    return subErrors;
  }
}
