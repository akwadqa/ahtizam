// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyOrderModelImpl _$$MyOrderModelImplFromJson(Map<String, dynamic> json) =>
    _$MyOrderModelImpl(
      driverName: json['driverName'] as String,
      driverImage: json['driverImage'] as String,
      driverRating: (json['driverRating'] as num).toDouble(),
      otpNumber: json['otpNumber'] as String,
      paymentMethod: json['paymentMethod'] as String,
      truckNumber: json['truckNumber'] as String,
      fromAddress: json['fromAddress'] as String,
      toAddress: json['toAddress'] as String,
      price: (json['price'] as num).toDouble(),
      date: json['date'] as String,
      time: json['time'] as String,
      userLocation: const LatLngConverter()
          .fromJson(json['userLocation'] as Map<String, dynamic>),
      destinationLocation: const LatLngConverter()
          .fromJson(json['destinationLocation'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$MyOrderModelImplToJson(_$MyOrderModelImpl instance) =>
    <String, dynamic>{
      'driverName': instance.driverName,
      'driverImage': instance.driverImage,
      'driverRating': instance.driverRating,
      'otpNumber': instance.otpNumber,
      'paymentMethod': instance.paymentMethod,
      'truckNumber': instance.truckNumber,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'price': instance.price,
      'date': instance.date,
      'time': instance.time,
      'userLocation': const LatLngConverter().toJson(instance.userLocation),
      'destinationLocation':
          const LatLngConverter().toJson(instance.destinationLocation),
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.all: 'all',
  OrderStatus.accepted: 'accepted',
  OrderStatus.pending: 'pending',
  OrderStatus.rejected: 'rejected',
};
