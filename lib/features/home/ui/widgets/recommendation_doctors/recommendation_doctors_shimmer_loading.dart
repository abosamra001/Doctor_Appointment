import 'package:advanced2/core/widgets/container_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';

class RecommendationDoctorsShimmerLoading extends StatelessWidget {
  const RecommendationDoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const ContainerShimmerLoading(
            width: 180,
            height: 18,
            borderRadius: 28,
          ),
          verticalSpace(16),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, i) => Container(
                width: double.infinity,
                height: 126.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  children: [
                    const ContainerShimmerLoading(
                      width: 110,
                      height: 110,
                      borderRadius: 16,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 16.h,
                        ),
                        child: const Column(
                          crossAxisAlignment: .start,
                          mainAxisAlignment: .spaceAround,
                          children: [
                            ContainerShimmerLoading(
                              width: 180,
                              height: 18,
                              borderRadius: 16,
                            ),
                            ContainerShimmerLoading(
                              width: 160,
                              height: 14,
                              borderRadius: 16,
                            ),
                            ContainerShimmerLoading(
                              width: 140,
                              height: 12,
                              borderRadius: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
