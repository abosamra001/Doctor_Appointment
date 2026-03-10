import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacer.dart';
import '../../../../../core/theme/styles.dart';

class NameAndEmail extends StatelessWidget {
  final String name;
  final String email;
  const NameAndEmail({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(90),
        Text(name, style: AppTextStyles.font20BlackSemiBold),
        verticalSpace(6),
        Text(
          email,
          style: AppTextStyles.font14DartBlueRegular.copyWith(
            color: Colors.black.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }
}
