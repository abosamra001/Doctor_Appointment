import 'package:advanced2/core/widgets/screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacer.dart';
import '../../../home/data/models/specialization_response.dart';
import '../../../home/logic/cubit/home_cubit.dart';
import '../../../home/ui/widgets/doctor_speciality.dart';
import '../../../home/ui/widgets/home_find_nearby_banner.dart';
import '../../../home/ui/widgets/home_top_bar.dart';
import '../../../home/ui/widgets/recommendation_doctor.dart';
import '../../../home/ui/widgets/recommendation_doctor_item.dart';
import '../../logic/cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SpecializationData> specializationData = [];
  List<RecommendationDoctorItem> recommendationDoctorItems = [];
  int? currentSelectedSpecialization;

  void _onSpecialityTap(int index) {
    setState(() {
      currentSelectedSpecialization = index;
      recommendationDoctorItems.clear();

      final doctors = specializationData[index].doctorsData;

      for (var doctor in doctors) {
        recommendationDoctorItems.add(
          RecommendationDoctorItem(
            doctorName: doctor.name,
            image: doctor.photo,
            degree: doctor.degree,
            phoneNumber: doctor.phone,
            email: doctor.email,
          ),
        );
      }
    });
  }

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
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is UserLoading ||
                      current is UserSuccess ||
                      current is UserError,
                  builder: (context, state) {
                    String userName = 'Chief';
                    state.whenOrNull(
                      userSuccess: (data) {
                        userName = data.userData[0].name;
                      },
                    );
                    return HomeTopBar(name: userName);
                  },
                ),
                const HomeFindNearbyBanner(),
                verticalSpace(16),

                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is SpecializationLoading ||
                      current is SpecializationSuccess ||
                      current is SpecializationError,
                  builder: (context, state) {
                    return state.maybeWhen(
                      specializationLoading: () =>
                          const Center(child: CircularProgressIndicator()),
                      specializationSuccess: (specializationResponse) {
                        specializationData =
                            specializationResponse.specializationData;

                        return Expanded(
                          child: Column(
                            children: [
                              DoctorSpeciality(
                                items: specializationData,
                                selectedItem: currentSelectedSpecialization,
                                onSpecialityTap: _onSpecialityTap,
                              ),
                              Expanded(
                                child: RecommendationDoctors(
                                  doctors: recommendationDoctorItems,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      specializationError: (error) {
                        return const SizedBox.shrink();
                      },
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
