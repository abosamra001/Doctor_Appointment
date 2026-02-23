import 'package:advanced2/core/helpers/extensions.dart';
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
    required String error,
    List<String>? subError,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        title: Text(error, style: TextStyles.font15DarkBlueMedium),
        content: (subError != null && subError.isNotEmpty)
            ? Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  ...subError.map(
                    (error) =>
                        Text(error, style: TextStyles.font13DartBlueReqular),
                  ),
                ],
              )
            : null,
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
        actionsAlignment: .center,
      ),
    );
  }

  static void showSuccessStateDialog(
    BuildContext context,
    String message,
    VoidCallback onPressed,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.done, color: Colors.green, size: 45),
        content: Text(message, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text('Continue', style: TextStyles.font14BlueSemiBold),
          ),
        ],
        actionsAlignment: .center,
      ),
    );
  }
}
