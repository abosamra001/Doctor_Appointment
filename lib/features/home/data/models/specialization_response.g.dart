// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationResponse _$SpecializationResponseFromJson(
  Map<String, dynamic> json,
) => SpecializationResponse(
  specializationData: (json['data'] as List<dynamic>)
      .map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecializationResponseToJson(
  SpecializationResponse instance,
) => <String, dynamic>{'data': instance.specializationData};

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      id: (json['id'] as num).toInt(),
      speciality: json['name'] as String,
      doctorsData: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.speciality,
      'doctors': instance.doctorsData,
    };

DoctorsData _$DoctorsDataFromJson(Map<String, dynamic> json) => DoctorsData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  photo: json['photo'] as String,
  gender: json['gender'] as String,
  degree: json['degree'] as String,
  price: (json['appoint_price'] as num).toInt(),
);

Map<String, dynamic> _$DoctorsDataToJson(DoctorsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'gender': instance.gender,
      'degree': instance.degree,
      'appoint_price': instance.price,
    };
