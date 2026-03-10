import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;
  const SpecialityItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected ? () {} : onTap,
      child: SizedBox(
        width: 74.w,
        height: 86.h,
        child: Column(
          children: [
            Container(
              width: isSelected ? 60.w : 56.w,
              height: isSelected ? 60.w : 56.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorManager.mainBlue.withAlpha(155)
                    : ColorManager.blueWhite,
                shape: BoxShape.circle,
              ),
              child: Image.asset(iconPath),
            ),
            verticalSpace(8),
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.font11BlueSemiBold
                  : AppTextStyles.font11DartBlueReqular,
              overflow: .ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
