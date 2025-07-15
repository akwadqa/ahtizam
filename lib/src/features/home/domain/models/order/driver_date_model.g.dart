// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDateModelImpl _$$DriverDateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverDateModelImpl(
      driverId: json['driver_id'] as String?,
      driverEmail: json['driver_email'] as String?,
      status: json['status'] as String,
      available: (json['available'] as num).toInt(),
      name: json['driver_name'] as String,
      image: json['driver_image'] as String?,
      phone: json['driver_number'] as String,
      vehicleType: json['vehicle_type'] as String,
      rate: (json['driver_rate'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$DriverDateModelImplToJson(
        _$DriverDateModelImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'driver_email': instance.driverEmail,
      'status': instance.status,
      'available': instance.available,
      'driver_name': instance.name,
      'driver_image': instance.image,
      'driver_number': instance.phone,
      'vehicle_type': instance.vehicleType,
      'driver_rate': instance.rate,
      'lat': instance.lat,
      'lng': instance.lng,
    };
