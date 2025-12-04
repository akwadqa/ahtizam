// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverInfoModel _$DriverInfoModelFromJson(Map<String, dynamic> json) =>
    _DriverInfoModel(
      serviceType: json['service_type'] as String,
      qid: json['driver_qid'] as String,
      fullName: json['driver_full_name'] as String,
      driverPhone: json['driver_phone_number'] as String,
      profileImage: json['profile_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DriverInfoModelToJson(_DriverInfoModel instance) =>
    <String, dynamic>{
      'service_type': instance.serviceType,
      'driver_qid': instance.qid,
      'driver_full_name': instance.fullName,
      'driver_phone_number': instance.driverPhone,
      'profile_image': instance.profileImage,
      'rating': instance.rating,
    };
