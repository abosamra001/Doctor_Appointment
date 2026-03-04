import 'package:json_annotation/json_annotation.dart';

part 'specialization_response.g.dart';

@JsonSerializable()
class SpecializationResponse {
  @JsonKey(name: 'data')
  final List<SpecializationData> specializationData;

  const SpecializationResponse({required this.specializationData});

  factory SpecializationResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseFromJson(json);
}

@JsonSerializable()
class SpecializationData {
  final int id;
  @JsonKey(name: 'name')
  final String speciality;
  @JsonKey(name: 'doctors')
  final List<DoctorsData> doctorsData;

  const SpecializationData({
    required this.id,
    required this.speciality,
    required this.doctorsData,
  });

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);
}

@JsonSerializable()
class DoctorsData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String degree;
  @JsonKey(name: 'appoint_price')
  final int price;

  const DoctorsData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.degree,
    required this.price,
  });

  factory DoctorsData.fromJson(Map<String, dynamic> json) =>
      _$DoctorsDataFromJson(json);
}
