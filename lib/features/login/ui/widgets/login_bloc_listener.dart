import 'package:advanced2/core/helpers/app_dialogs.dart';
import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/networking/api_error_model.dart';
import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced2/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  final Widget child;
  const LoginBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () => AppDialogs.showLoadingIndicator(context),

          loginSuccess: (loginResponse) =>
              context.pushReplacementNamed(Routes.homeScreen),

          loginError: (error) {
            context.pop();
            AppDialogs.showErrorStateDialog(
              context,
              apiErrorModel: ApiErrorModel(message: error),
            );
          },
        );
      },
      child: child,
    );
  }
}
