import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/core/theme/styles.dart';
import 'package:advanced2/core/widgets/container_shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: CachedNetworkImage(
              imageUrl:
                  'https://i.pinimg.com/474x/20/c4/2f/20c42f3ab15e81f2f8da8ac6339d506c.jpg',
              placeholder: (context, url) => const ContainerShimmerLoading(
                width: 110,
                height: 110,
                borderRadius: 16,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
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
                    doctorName,
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
