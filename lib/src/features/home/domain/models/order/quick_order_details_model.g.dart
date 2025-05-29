// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuickOrderDetailsModelImpl _$$QuickOrderDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuickOrderDetailsModelImpl(
      status: json['order_status'] as String,
      driverData: json['driver_data'] == null
          ? null
          : DriverDateModel.fromJson(
              json['driver_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuickOrderDetailsModelImplToJson(
        _$QuickOrderDetailsModelImpl instance) =>
    <String, dynamic>{
      'order_status': instance.status,
      'driver_data': instance.driverData,
    };
