import 'package:advanced2/core/helpers/extensions.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(const HomeState.initial());

  List<SpecializationData> specializationData = [];

  Future<void> getAllSpecializations() async {
    emit(const HomeState.specializationLoading());
    final res = await homeRepo.getAllSpecializations();
    res.when(
      success: (specializationResponse) {
        specializationData = specializationResponse.specializationData;
        getDoctorsDataById(specializationData.first.id);
        emit(HomeState.specializationSuccess(specializationData));
      },
      failure: (errorHandler) => emit(
        HomeState.specializationError(errorHandler.apiErrorModel.message),
      ),
    );
  }

  void getDoctorsDataById(int id) {
    final doctorsData = specializationData
        .firstWhere((element) => element.id == id)
        .doctorsData;
    if (doctorsData.isNullOrEmpty()) {
      emit(const HomeState.doctorsError('No doctors found!'));
    } else {
      emit(HomeState.doctorsSucces(doctorsData));
    }
  }

  Future<void> getUserProfile() async {
    emit(const HomeState.userLoading());
    final res = await homeRepo.getUserProfile();
    res.when(
      success: (userResponse) => emit(HomeState.userSuccess(userResponse)),
      failure: (error) =>
          emit(HomeState.userError(error.apiErrorModel.message)),
    );
  }
}
