import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;
  const SpecialityItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 74.w,
        height: 86.h,
        child: Column(
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: const BoxDecoration(
                color: ColorManager.blueWhite,
                shape: BoxShape.circle,
              ),
              child: Image.asset(iconPath),
            ),
            verticalSpace(8),
            Text(label, style: AppTextStyles.font12DartBlueReqular),
          ],
        ),
      ),
    );
  }
}
