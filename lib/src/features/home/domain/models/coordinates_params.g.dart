// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoordinatesParams _$CoordinatesParamsFromJson(Map<String, dynamic> json) =>
    _CoordinatesParams(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$CoordinatesParamsToJson(_CoordinatesParams instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
    };
