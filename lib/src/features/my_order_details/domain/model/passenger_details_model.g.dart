// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PassengerDetailsImpl _$$PassengerDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PassengerDetailsImpl(
      passenger: json['passenger'] as String,
      fullName: json['full_name'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$PassengerDetailsImplToJson(
        _$PassengerDetailsImpl instance) =>
    <String, dynamic>{
      'passenger': instance.passenger,
      'full_name': instance.fullName,
      'profile_image': instance.profileImage,
    };
