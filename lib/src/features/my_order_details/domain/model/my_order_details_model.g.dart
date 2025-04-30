// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyOrderDetailsModelImpl _$$MyOrderDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyOrderDetailsModelImpl(
      driverImage: json['driverImage'] as String,
      driverName: json['driverName'] as String,
      driverRating: json['driverRating'] as String,
      vehicleType: json['vehicleType'] as String,
      vehicleId: json['vehicleId'] as String,
      orderStart: json['orderStart'] as String,
      orderNumber: json['orderNumber'] as String,
      orderEnd: json['orderEnd'] as String,
      orderTimeStart: json['orderTimeStart'] as String,
      orderTimeEnd: json['orderTimeEnd'] as String,
      date: json['date'] as String,
      price: (json['price'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
    );

Map<String, dynamic> _$$MyOrderDetailsModelImplToJson(
        _$MyOrderDetailsModelImpl instance) =>
    <String, dynamic>{
      'driverImage': instance.driverImage,
      'driverName': instance.driverName,
      'driverRating': instance.driverRating,
      'vehicleType': instance.vehicleType,
      'vehicleId': instance.vehicleId,
      'orderStart': instance.orderStart,
      'orderNumber': instance.orderNumber,
      'orderEnd': instance.orderEnd,
      'orderTimeStart': instance.orderTimeStart,
      'orderTimeEnd': instance.orderTimeEnd,
      'date': instance.date,
      'price': instance.price,
      'paymentMethod': instance.paymentMethod,
    };
