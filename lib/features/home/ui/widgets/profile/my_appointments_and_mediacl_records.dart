import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsAndMediaclRecords extends StatelessWidget {
  const MyAppointmentsAndMediaclRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: ColorManager.whiteSmoke,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Text('My Appointments', style: AppTextStyles.font12DartBlueReqular),
          const Spacer(),
          Container(
            width: 2,
            height: 42,
            decoration: const BoxDecoration(color: ColorManager.lighterGray),
          ),
          const Spacer(),
          Text('Medical records', style: AppTextStyles.font12DartBlueReqular),
        ],
      ),
    );
  }
}
