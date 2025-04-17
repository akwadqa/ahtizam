// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      pickupLocation: const GeoPointConverter()
          .fromJson(json['pickupLocation'] as Map<String, dynamic>),
      workshopLocation: const GeoPointConverter()
          .fromJson(json['workshopLocation'] as Map<String, dynamic>),
      truckType: json['truckType'] as String,
      status: json['status'] as String,
      assignedDriverId: json['assignedDriverId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pickupLocation':
          const GeoPointConverter().toJson(instance.pickupLocation),
      'workshopLocation':
          const GeoPointConverter().toJson(instance.workshopLocation),
      'truckType': instance.truckType,
      'status': instance.status,
      'assignedDriverId': instance.assignedDriverId,
      'createdAt': instance.createdAt.toIso8601String(),
      'price': instance.price,
    };
