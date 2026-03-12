import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/networking/api_error_model.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';

class AppDialogs {
  static void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: ColorManager.mainBlue),
      ),
    );
  }

  static void showErrorStateDialog(
    BuildContext context, {
    required ApiErrorModel apiErrorModel,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        title: Text(
          apiErrorModel.message,
          style: AppTextStyles.font15DarkBlueMedium,
        ),
        content: Text(
          apiErrorModel.parseSubErrors(),
          style: AppTextStyles.font13DartBlueReqular,
        ),

        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: AppTextStyles.font14BlueSemiBold),
          ),
        ],
        actionsAlignment: .center,
      ),
    );
  }

  static void showSuccessStateDialog(
    BuildContext context, {
    required String message,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.done, color: Colors.green, size: 45),
        content: Text(message, style: AppTextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text('Continue', style: AppTextStyles.font14BlueSemiBold),
          ),
        ],
        actionsAlignment: .center,
      ),
    );
  }
}
