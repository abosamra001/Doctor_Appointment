import 'package:advanced2/core/widgets/container_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacer.dart';

class DoctorSpecialityShimmerLoading extends StatelessWidget {
  const DoctorSpecialityShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const ContainerShimmerLoading(width: 180, height: 18, borderRadius: 28),
        verticalSpace(12),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,

            itemBuilder: (context, i) {
              return SizedBox(
                width: 74.w,
                height: 86.h,
                child: Column(
                  children: [
                    const ContainerShimmerLoading(
                      width: 56,
                      height: 56,
                      borderRadius: 28,
                    ),
                    verticalSpace(8),
                    const ContainerShimmerLoading(
                      width: 50,
                      height: 14,
                      borderRadius: 12,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
