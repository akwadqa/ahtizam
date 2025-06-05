// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoordinatesParamsImpl _$$CoordinatesParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CoordinatesParamsImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$CoordinatesParamsImplToJson(
        _$CoordinatesParamsImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
