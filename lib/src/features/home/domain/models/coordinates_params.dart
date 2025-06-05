import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates_params.freezed.dart';
part 'coordinates_params.g.dart';

@freezed
class CoordinatesParams with _$CoordinatesParams {
  const factory CoordinatesParams({
    required double lat,
    required double lng,
    required String address,
  }) = _CoordinatesParams;

  factory CoordinatesParams.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesParamsFromJson(json);
}
