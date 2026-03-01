import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopBar extends StatelessWidget {
  final String name;
  const HomeTopBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,

      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text('Hi, $name!', style: AppTextStyles.font18DarkBlueBold),
            Text('How are you Today?', style: AppTextStyles.font11GrayReqular),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: ColorManager.whiteSmoke,
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 24.w,
              color: ColorManager.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
