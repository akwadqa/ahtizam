// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDetailsImpl _$$DriverDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DriverDetailsImpl(
      assignedDate: DateTime.parse(json['assigned_date'] as String),
      assignedTime: json['assigned_time'] as String,
      assignedDriver: json['assigned_driver'] as String,
      fullName: json['full_name'] as String,
      driverPhone: json['phone'] as String,
      profileImage: json['profile_image'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DriverDetailsImplToJson(_$DriverDetailsImpl instance) =>
    <String, dynamic>{
      'assigned_date': instance.assignedDate.toIso8601String(),
      'assigned_time': instance.assignedTime,
      'assigned_driver': instance.assignedDriver,
      'full_name': instance.fullName,
      'phone': instance.driverPhone,
      'profile_image': instance.profileImage,
      'rating': instance.rating,
    };
