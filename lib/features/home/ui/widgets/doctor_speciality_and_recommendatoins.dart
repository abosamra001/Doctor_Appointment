import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/specialization_response.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import 'doctor_speciality.dart';
import 'recommendation_doctor.dart';
import 'recommendation_doctor_item.dart';

class DoctorSpecialityAndRecommendatoins extends StatefulWidget {
  const DoctorSpecialityAndRecommendatoins({super.key});

  @override
  State<DoctorSpecialityAndRecommendatoins> createState() =>
      _DoctorSpecialityAndRecommendatoinsState();
}

class _DoctorSpecialityAndRecommendatoinsState
    extends State<DoctorSpecialityAndRecommendatoins> {
  List<SpecializationData> specializationData = [];
  List<RecommendationDoctorItem> recommendationDoctorItems = [];
  int? currentSelectedSpecialization;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () =>
              const Center(child: CircularProgressIndicator()),
          specializationSuccess: (specializationResponse) {
            specializationData = specializationResponse.specializationData;

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
    );
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
            degree: doctor.degree,
            phoneNumber: doctor.phone,
            email: doctor.email,
          ),
        );
      }
    });
  }
}
