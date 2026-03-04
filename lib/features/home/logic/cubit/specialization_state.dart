import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialization_state.freezed.dart';

@freezed
class SpecializationState<T> with _$SpecializationState<T> {
  const factory SpecializationState.initial() = _Initial;
  const factory SpecializationState.loading() = Loading;
  const factory SpecializationState.success(T data) = Success<T>;
  const factory SpecializationState.error({required String error}) = Error;
}
