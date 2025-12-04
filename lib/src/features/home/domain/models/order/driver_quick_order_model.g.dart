// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_quick_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverQuickOrderModel _$DriverQuickOrderModelFromJson(
  Map<String, dynamic> json,
) => _DriverQuickOrderModel(
  driverId: json['driver_id'] as String?,
  driverEmail: json['driver_email'] as String?,
  driverAddress: json['driver_address'] as String?,
  status: json['status'] as String,
  available: (json['available'] as num).toInt(),
  name: json['driver_name'] as String,
  image: json['driver_image'] as String?,
  phone: json['driver_number'] as String,
  vehicleType: json['vehicle_type'] as String?,
  vehiclePlateNumber: json['vehicle_plate_number'] as String?,
  rate: (json['driver_rating'] as num).toDouble(),
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DriverQuickOrderModelToJson(
  _DriverQuickOrderModel instance,
) => <String, dynamic>{
  'driver_id': instance.driverId,
  'driver_email': instance.driverEmail,
  'driver_address': instance.driverAddress,
  'status': instance.status,
  'available': instance.available,
  'driver_name': instance.name,
  'driver_image': instance.image,
  'driver_number': instance.phone,
  'vehicle_type': instance.vehicleType,
  'vehicle_plate_number': instance.vehiclePlateNumber,
  'driver_rating': instance.rate,
  'lat': instance.lat,
  'lng': instance.lng,
};
