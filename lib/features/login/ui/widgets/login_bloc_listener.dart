import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
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
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorManager.mainBlue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushaReplacementNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showErrorStateDialog(context, error);
          },
        );
      },
      child: child,
    );
  }

  void showErrorStateDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
