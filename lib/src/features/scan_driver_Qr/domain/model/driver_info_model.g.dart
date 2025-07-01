// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverInfoModelImpl _$$DriverInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverInfoModelImpl(
      serviceType: json['service_type'] as String,
      qid: (json['qid'] as num).toInt(),
      fullName: json['full_name'] as String,
      driverPhone: json['mobile_no'] as String,
      profileImage: json['profile_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DriverInfoModelImplToJson(
        _$DriverInfoModelImpl instance) =>
    <String, dynamic>{
      'service_type': instance.serviceType,
      'qid': instance.qid,
      'full_name': instance.fullName,
      'mobile_no': instance.driverPhone,
      'profile_image': instance.profileImage,
      'rating': instance.rating,
    };
