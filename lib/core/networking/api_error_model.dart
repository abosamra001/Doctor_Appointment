import 'package:advanced2/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String message;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? subErrors;
  final bool? status;
  final int? code;

  ApiErrorModel({
    required this.message,
    this.subErrors,
    this.status,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String parseSubErrors() {
    if (subErrors.isNullOrEmpty()) return '';

    String error = subErrors!.values
        .where((value) => value.isNotEmpty)
        .map(((value) => value.first))
        .join('\n');
    return error;
  }
}
