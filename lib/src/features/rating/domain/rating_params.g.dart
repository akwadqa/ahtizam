// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingParamsImpl _$$RatingParamsImplFromJson(Map<String, dynamic> json) =>
    _$RatingParamsImpl(
      driverId: json['driver_id'] as String,
      rating: json['rating'] as String,
      comment: json['comment'] as String?,
      referenceDoctype: json['reference_doctype'] as String?,
      referenceName: json['reference_name'] as String?,
    );

Map<String, dynamic> _$$RatingParamsImplToJson(_$RatingParamsImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'rating': instance.rating,
      if (instance.comment case final value?) 'comment': value,
      if (instance.referenceDoctype case final value?)
        'reference_doctype': value,
      if (instance.referenceName case final value?) 'reference_name': value,
    };
