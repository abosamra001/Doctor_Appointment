import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecommendationDoctorItem extends StatelessWidget {
  final String doctorName;
  final String image;
  final String degree;
  final String phoneNumber;
  final String email;
  const RecommendationDoctorItem({
    super.key,
    required this.doctorName,
    required this.image,
    required this.degree,
    required this.phoneNumber,
    required this.email,
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
            child: Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SvgPicture.asset(
                  'assets/svgs/doctor_placeholder.svg',
                  fit: BoxFit.cover,
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
            ),
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
                  Row(
                    crossAxisAlignment: .end,
                    children: [
                      Text(degree, style: AppTextStyles.font12GrayMedium),
                      horizontalSpace(2),
                      Text(
                        ' | $phoneNumber',
                        style: AppTextStyles.font12GrayMedium,
                      ),
                    ],
                  ),
                  Text(
                    email,
                    style: AppTextStyles.font12GrayReqular,
                    overflow: TextOverflow.ellipsis,
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
