import 'package:freezed_annotation/freezed_annotation.dart';

part 'passenger_coordinates_params.freezed.dart';
part 'passenger_coordinates_params.g.dart';

@freezed
class PassengerCoordinatesParams with _$PassengerCoordinatesParams {
  const factory PassengerCoordinatesParams({
    required double lat,
    required double lng,
  }) = _PassengerCoordinatesParams;

  factory PassengerCoordinatesParams.fromJson(Map<String, dynamic> json) =>
      _$PassengerCoordinatesParamsFromJson(json);
}
