import 'package:advanced2/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(const HomeState.initial());

  void getAllSpecializations() async {
    emit(const HomeState.specializationLoading());
    final res = await homeRepo.getAllSpecializations();
    res.when(
      success: (specializationResponse) =>
          emit(HomeState.specializationSuccess(specializationResponse)),
      failure: (errorHandler) => emit(
        HomeState.specializationError(errorHandler.apiErrorModel.message),
      ),
    );
  }

  void getUserProfile() async {
    emit(const HomeState.userLoading());
    final res = await homeRepo.getUserProfile();
    res.when(
      success: (userResponse) => emit(HomeState.userSuccess(userResponse)),
      failure: (error) =>
          emit(HomeState.userError(error.apiErrorModel.message)),
    );
  }
}
