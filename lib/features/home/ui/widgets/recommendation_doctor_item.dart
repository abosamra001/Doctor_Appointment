import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/colors.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctorItem extends StatelessWidget {
  final String doctorName;
  final String imagePath;
  final String specialize;
  final String rating;
  final String reviewCount;
  const RecommendationDoctorItem({
    super.key,
    required this.doctorName,
    required this.imagePath,
    required this.specialize,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .spaceAround,
                children: [
                  Text(
                    'Dr. $doctorName',
                    style: AppTextStyles.font16DarkBlueBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    specialize,
                    style: AppTextStyles.font12GrayReqular,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: .end,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: ColorManager.gold,
                        size: 20.sp,
                      ),
                      Text(rating, style: AppTextStyles.font12GrayMedium),
                      horizontalSpace(2),
                      Text(reviewCount, style: AppTextStyles.font12GrayMedium),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
