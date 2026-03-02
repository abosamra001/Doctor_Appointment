import 'package:advanced2/core/helpers/app_dialogs.dart';
import 'package:advanced2/core/helpers/extensions.dart';
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
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => AppDialogs.showLoadingIndicator(context),

          success: (loginResponse) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen, arg: loginResponse);
          },
          error: (error) {
            context.pop();
            AppDialogs.showErrorStateDialog(context, error: error);
          },
        );
      },
      child: child,
    );
  }
}
