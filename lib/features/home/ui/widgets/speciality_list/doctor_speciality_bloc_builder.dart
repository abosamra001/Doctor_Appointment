import 'package:advanced2/core/helpers/spacer.dart';
import 'package:advanced2/features/home/ui/widgets/recommendation_doctors/recommendation_doctors_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_state.dart';
import 'doctor_speciality.dart';
import 'doctor_speciality_shimmer_loading.dart';

class DoctorSpecialityBlocBuilder extends StatelessWidget {
  const DoctorSpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: setUpLoading,
          specializationSuccess: (specializationData) {
            return DoctorSpeciality(items: specializationData);
          },
          specializationError: (error) => shrinkedBox(),
          orElse: shrinkedBox,
        );
      },
    );
  }

  Widget setUpLoading() {
    return Expanded(
      child: Column(
        children: [
          const DoctorSpecialityShimmerLoading(),
          verticalSpace(8),
          const RecommendationDoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget shrinkedBox() {
    return const SizedBox.shrink();
  }
}
