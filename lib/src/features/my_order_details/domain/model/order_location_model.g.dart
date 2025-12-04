// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLocationModel _$OrderLocationModelFromJson(Map<String, dynamic> json) =>
    _OrderLocationModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$OrderLocationModelToJson(_OrderLocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };
