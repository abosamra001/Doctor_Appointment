import 'package:advanced2/core/helpers/app_dialogs.dart';
import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/logic/cubit/specialization_cubit.dart';
import 'package:advanced2/features/home/logic/cubit/specialization_state.dart';
import 'package:advanced2/features/home/ui/widgets/doctor_speciality.dart';
import 'package:advanced2/features/home/ui/widgets/home_find_nearby_banner.dart';
import 'package:advanced2/features/home/ui/widgets/home_top_bar.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctor.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final String? userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SpecializationData> specializationData = [];
  List<RecommendationDoctorItem> recommendationDoctorItems = [];
  int? currentSelectedSpecialization;

  @override
  void initState() {
    super.initState();
    context.read<SpecializationCubit>().emitSpecializationState();
  }

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
            specialize: doctor.degree,
            rating: '4.0',
            reviewCount: '4,234',
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SpecializationCubit, SpecializationState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => AppDialogs.showLoadingIndicator(context),
          success: (data) {
            final specializationResponse = data as SpecializationResponse;
            setState(() {
              specializationData = specializationResponse.specializationData;
            });
          },
          error: (error) =>
              AppDialogs.showErrorStateDialog(context, error: error),
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                HomeTopBar(name: widget.userName ?? "Chief"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const HomeFindNearbyBanner(),
                        verticalSpace(24),
                        DoctorSpeciality(
                          items: specializationData,
                          selectedItem: currentSelectedSpecialization,
                          onSpecialityTap: _onSpecialityTap,
                        ),
                        verticalSpace(24),
                        RecommendationDoctors(
                          doctors: recommendationDoctorItems,
                        ),
                        verticalSpace(24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
