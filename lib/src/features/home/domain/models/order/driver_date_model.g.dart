// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDateModelImpl _$$DriverDateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverDateModelImpl(
      driverId: json['driver_id'] as String?,
      status: json['status'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$DriverDateModelImplToJson(
        _$DriverDateModelImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'status': instance.status,
      'lat': instance.lat,
      'lng': instance.lng,
    };
