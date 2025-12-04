// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverOfferModel _$DriverOfferModelFromJson(Map<String, dynamic> json) =>
    _DriverOfferModel(
      driverId: json['driver'] as String,
      driverAddress: json['driver_address'] as String,
      driverEmail: json['driver_email'] as String,
      driverImage: json['driver_image'] as String?,
      driverName: json['driver_name'] as String,
      driverNumber: json['driver_number'] as String,
      eta: json['eta'] as String,
      price: (json['price'] as num).toDouble(),
      driverRating: (json['driver_rating'] as num).toDouble(),
      quickOrderOfferId: json['quick_order_offer_id'] as String,
      vehicleType: json['vehicle_type'] as String,
      vehicleCapacity: json['vehicle_capacity'] as String,
      vehicleSize: json['vehicle_size'] as String,
      vehiclePlateNumber: json['vehicle_plate_number'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      status: json['status'] as String,
      available: (json['available'] as num).toInt(),
    );

Map<String, dynamic> _$DriverOfferModelToJson(_DriverOfferModel instance) =>
    <String, dynamic>{
      'driver': instance.driverId,
      'driver_address': instance.driverAddress,
      'driver_email': instance.driverEmail,
      'driver_image': instance.driverImage,
      'driver_name': instance.driverName,
      'driver_number': instance.driverNumber,
      'eta': instance.eta,
      'price': instance.price,
      'driver_rating': instance.driverRating,
      'quick_order_offer_id': instance.quickOrderOfferId,
      'vehicle_type': instance.vehicleType,
      'vehicle_capacity': instance.vehicleCapacity,
      'vehicle_size': instance.vehicleSize,
      'vehicle_plate_number': instance.vehiclePlateNumber,
      'lat': instance.lat,
      'lng': instance.lng,
      'status': instance.status,
      'available': instance.available,
    };
