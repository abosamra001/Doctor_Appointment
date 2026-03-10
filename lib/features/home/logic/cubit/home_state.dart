import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/data/models/user_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specialization States
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(List<SpecializationData> data) =
      SpecializationSuccess;
  const factory HomeState.specializationError(String error) =
      SpecializationError;

  const factory HomeState.doctorsSucces(List<DoctorsData> doctors) =
      DoctorsSuccess;
  const factory HomeState.doctorsError(String error) = DoctorsError;

  // User States
  const factory HomeState.userLoading() = UserLoading;
  const factory HomeState.userSuccess(UserResponse data) = UserSuccess;
  const factory HomeState.userError(String error) = UserError;
}
