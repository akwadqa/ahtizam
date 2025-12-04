// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuickOrderDetailsModel _$QuickOrderDetailsModelFromJson(
  Map<String, dynamic> json,
) => _QuickOrderDetailsModel(
  status: json['order_status'] as String,
  driverData: json['driver_data'] == null
      ? null
      : DriverQuickOrderModel.fromJson(
          json['driver_data'] as Map<String, dynamic>,
        ),
  offers: (json['offers'] as List<dynamic>?)
      ?.map((e) => DriverOfferModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuickOrderDetailsModelToJson(
  _QuickOrderDetailsModel instance,
) => <String, dynamic>{
  'order_status': instance.status,
  'driver_data': instance.driverData,
  'offers': instance.offers,
};
