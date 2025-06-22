// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FareDetailsImpl _$$FareDetailsImplFromJson(Map<String, dynamic> json) =>
    _$FareDetailsImpl(
      baseFare: (json['base_fare'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      taxFee: (json['tax_fee'] as num).toDouble(),
      finalFare: (json['final_fare'] as num).toDouble(),
    );

Map<String, dynamic> _$$FareDetailsImplToJson(_$FareDetailsImpl instance) =>
    <String, dynamic>{
      'base_fare': instance.baseFare,
      'discount_amount': instance.discountAmount,
      'tax_fee': instance.taxFee,
      'final_fare': instance.finalFare,
    };
