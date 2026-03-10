import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/colors.dart';

class ContainerShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color baseColor;
  final Color highlightColor;
  const ContainerShimmerLoading({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.baseColor = ColorManager.lighterGray,
    this.highlightColor = ColorManager.blueWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: highlightColor,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
    );
  }
}
