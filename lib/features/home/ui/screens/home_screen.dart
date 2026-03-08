import 'package:advanced2/core/widgets/screen_wrapper.dart';
import 'package:advanced2/features/home/ui/widgets/doctor_speciality_and_recommendatoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../home/ui/widgets/home_find_nearby_banner.dart';
import '../../../home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const HomeTopBar(),
                const HomeFindNearbyBanner(),
                verticalSpace(16),
                const DoctorSpecialityAndRecommendatoins(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
