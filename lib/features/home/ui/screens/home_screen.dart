import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/features/home/ui/widgets/doctor_speciality.dart';
import 'package:advanced2/features/home/ui/widgets/home_find_nearby_banner.dart';
import 'package:advanced2/features/home/ui/widgets/home_top_bar.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const HomeTopBar(name: 'Omar'),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const HomeFindNearbyBanner(),
                    verticalSpace(24),
                    const DoctorSpeciality(),
                    verticalSpace(24),
                    RecommendationDoctor(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
