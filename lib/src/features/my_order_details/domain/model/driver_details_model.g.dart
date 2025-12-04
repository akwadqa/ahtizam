// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverDetails _$DriverDetailsFromJson(Map<String, dynamic> json) =>
    _DriverDetails(
      assignedDriver: json['assigned_driver'] as String?,
      fullName: json['full_name'] as String?,
      driverPhone: json['phone'] as String?,
      profileImage: json['profile_image'] as String?,
      rating: (json['driver_rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DriverDetailsToJson(_DriverDetails instance) =>
    <String, dynamic>{
      'assigned_driver': instance.assignedDriver,
      'full_name': instance.fullName,
      'phone': instance.driverPhone,
      'profile_image': instance.profileImage,
      'driver_rating': instance.rating,
    };
