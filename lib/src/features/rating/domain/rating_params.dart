import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_params.freezed.dart';
part 'rating_params.g.dart';

@freezed
abstract class RatingParams with _$RatingParams {
  const factory RatingParams({
    @JsonKey(name: 'driver_id') required String driverId,
    @JsonKey(name: 'rating') required String rating,
    @JsonKey(includeIfNull: false) String? comment,
    @JsonKey(includeIfNull: false, name: 'reference_doctype') String? referenceDoctype,
    @JsonKey(includeIfNull: false, name: 'reference_name') String? referenceName,
  }) = _RatingParams;

  factory RatingParams.fromJson(Map<String, dynamic> json) =>
      _$RatingParamsFromJson(json);
}
