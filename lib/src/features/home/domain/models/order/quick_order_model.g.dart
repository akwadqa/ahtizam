// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuickOrderModelImpl _$$QuickOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuickOrderModelImpl(
      quickOrderId: json['quick_order_id'] as String,
      baseFee: (json['base_fee'] as num).toDouble(),
      taxFee: (json['tax_fee'] as num).toDouble(),
      discountCost: (json['discount_cost'] as num?)?.toDouble(),
      finalFee: (json['final_fee'] as num).toDouble(),
      eta: json['eta'] as String,
    );

Map<String, dynamic> _$$QuickOrderModelImplToJson(
        _$QuickOrderModelImpl instance) =>
    <String, dynamic>{
      'quick_order_id': instance.quickOrderId,
      'base_fee': instance.baseFee,
      'tax_fee': instance.taxFee,
      'discount_cost': instance.discountCost,
      'final_fee': instance.finalFee,
      'eta': instance.eta,
    };
