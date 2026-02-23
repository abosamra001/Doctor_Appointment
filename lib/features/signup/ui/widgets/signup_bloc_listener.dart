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
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => AppDialogs.showLoadingIndicator(context),
          success: (signupResponse) {
            context.pop();
            AppDialogs.showSuccessStateDialog(
              context,
              'Congratulations your account has created successfully! \nplease login to continue.',
              () {
                context.pop();
                context.pushReplacementNamed(Routes.loginScreen);
              },
            );
          },
          error: (errorModel) {
            context.pop();
            AppDialogs.showErrorStateDialog(
              context,
              error: errorModel.message,
              subError: parseValidationErrors(errorModel.data),
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
