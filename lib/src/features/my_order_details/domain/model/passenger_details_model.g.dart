// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PassengerDetails _$PassengerDetailsFromJson(Map<String, dynamic> json) =>
    _PassengerDetails(
      passenger: json['passenger'] as String,
      fullName: json['full_name'] as String?,
      driverPhone: json['phone'] as String?,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$PassengerDetailsToJson(_PassengerDetails instance) =>
    <String, dynamic>{
      'passenger': instance.passenger,
      'full_name': instance.fullName,
      'phone': instance.driverPhone,
      'profile_image': instance.profileImage,
    };
