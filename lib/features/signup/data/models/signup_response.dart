import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String message;
  final Data data;
  final bool status;
  final int code;

  SignupResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  Data({required this.token, required this.userName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
