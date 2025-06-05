// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceTypesModelImpl _$$ServiceTypesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceTypesModelImpl(
      serviceId: json['service_id'] as String,
      serviceItem: json['service_item'] as String,
      vehiclesSize: json['vehicles_size'] as String,
      vehicleCapacity: json['vehicle_capacity'] as String,
      serviceCostPerKm: (json['service_cost_per_km'] as num).toDouble(),
    );

Map<String, dynamic> _$$ServiceTypesModelImplToJson(
        _$ServiceTypesModelImpl instance) =>
    <String, dynamic>{
      'service_id': instance.serviceId,
      'service_item': instance.serviceItem,
      'vehicles_size': instance.vehiclesSize,
      'vehicle_capacity': instance.vehicleCapacity,
      'service_cost_per_km': instance.serviceCostPerKm,
    };
