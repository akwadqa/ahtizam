// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyOrderDetailsModelImpl _$$MyOrderDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyOrderDetailsModelImpl(
      quickOrderId: json['quick_order_id'] as String,
      status: json['status'] as String,
      driverDetails: DriverDetails.fromJson(
          json['driver_details'] as Map<String, dynamic>),
      passengerDetails: PassengerDetails.fromJson(
          json['passenger_details'] as Map<String, dynamic>),
      passengerLocation: OrderLocationModel.fromJson(
          json['passenger_location'] as Map<String, dynamic>),
      destinationLocation: OrderLocationModel.fromJson(
          json['destination_location'] as Map<String, dynamic>),
      mapImage: json['map_image'] as String?,
      serviceType: json['service_type'] as String,
      paymentMethod: json['payment_method'] as String,
      couponCode: json['coupon_code'] as String?,
      fareDetails:
          FareDetails.fromJson(json['fare_details'] as Map<String, dynamic>),
      creationDate: DateTime.parse(json['creation_date'] as String),
      creationTime: json['creation_time'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );

Map<String, dynamic> _$$MyOrderDetailsModelImplToJson(
        _$MyOrderDetailsModelImpl instance) =>
    <String, dynamic>{
      'quick_order_id': instance.quickOrderId,
      'status': instance.status,
      'driver_details': instance.driverDetails,
      'passenger_details': instance.passengerDetails,
      'passenger_location': instance.passengerLocation,
      'destination_location': instance.destinationLocation,
      'map_image': instance.mapImage,
      'service_type': instance.serviceType,
      'payment_method': instance.paymentMethod,
      'coupon_code': instance.couponCode,
      'fare_details': instance.fareDetails,
      'creation_date': instance.creationDate.toIso8601String(),
      'creation_time': instance.creationTime,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
