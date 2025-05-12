// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      fullName: json['full_name'] as String,
      mobileNumber: json['mobile_no'] as String,
      email: json['email'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'mobile_no': instance.mobileNumber,
      'email': instance.email,
      'profile_image': instance.profileImage,
    };
