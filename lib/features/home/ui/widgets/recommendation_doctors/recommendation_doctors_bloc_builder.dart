import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_state.dart';
import 'recommendation_doctor.dart';

class RecommendationDoctorsBlocBuilder extends StatelessWidget {
  const RecommendationDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        debugPrint('RecommendationDoctorsBlocBuilder is build');
        return state.maybeWhen(
          doctorsSucces: (doctorsDataList) => Expanded(
            child: RecommendationDoctors(doctorsDataList: doctorsDataList),
          ),
          doctorsError: (error) => shrinkedBox(),
          orElse: shrinkedBox,
        );
      },
    );
  }

  Widget shrinkedBox() {
    return const SizedBox.shrink();
  }
}
