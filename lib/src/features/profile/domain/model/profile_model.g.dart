// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      fullName: json['full_name'] as String,
      mobileNumber: json['mobile_no'] as String,
      email: json['email'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'mobile_no': instance.mobileNumber,
      'email': instance.email,
      'profile_image': instance.profileImage,
    };
