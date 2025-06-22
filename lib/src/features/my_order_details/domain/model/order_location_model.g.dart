// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLocationModelImpl _$$OrderLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderLocationModelImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$$OrderLocationModelImplToJson(
        _$OrderLocationModelImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
