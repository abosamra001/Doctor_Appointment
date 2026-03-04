import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/features/home/data/repos/specialization_repo.dart';
import 'package:advanced2/features/home/logic/cubit/specialization_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  final SpecializationRepo specializationRepo;
  SpecializationCubit({required this.specializationRepo})
    : super(const SpecializationState.initial());

  void emitSpecializationState() async {
    emit(const SpecializationState.loading());
    final res = await specializationRepo.getAllSpecializations();
    res.when(
      success: (specializationResponse) =>
          emit(SpecializationState.success(specializationResponse)),
      failure: (errorHandler) => emit(
        SpecializationState.error(error: errorHandler.apiErrorModel.message),
      ),
    );
  }
}
