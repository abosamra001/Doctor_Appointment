import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/core/routing/routes.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pushNamed(Routes.homeScreen),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(ColorManager.primaryBlue),
        minimumSize: WidgetStatePropertyAll(const Size(double.infinity, 50)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      child: Text('Get Started', style: TextStyles.font16GrayReqular),
    );
  }
}
