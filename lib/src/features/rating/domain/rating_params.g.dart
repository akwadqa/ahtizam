// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingParams _$RatingParamsFromJson(Map<String, dynamic> json) =>
    _RatingParams(
      driverId: json['driver_id'] as String,
      rating: json['rating'] as String,
      comment: json['comment'] as String?,
      referenceDoctype: json['reference_doctype'] as String?,
      referenceName: json['reference_name'] as String?,
    );

Map<String, dynamic> _$RatingParamsToJson(_RatingParams instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'rating': instance.rating,
      'comment': ?instance.comment,
      'reference_doctype': ?instance.referenceDoctype,
      'reference_name': ?instance.referenceName,
    };
