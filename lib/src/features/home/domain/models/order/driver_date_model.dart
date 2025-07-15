import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_date_model.freezed.dart';
part 'driver_date_model.g.dart';

@freezed
class DriverDateModel with _$DriverDateModel {
  factory DriverDateModel({
    @JsonKey(name: "driver_id") required String? driverId,
    @JsonKey(name: "driver_email") required String? driverEmail,
    required String status,
    required int available,
    @JsonKey(name: "driver_name") required String name,
    @JsonKey(name: "driver_image") String? image,
    @JsonKey(name: "driver_number") required String phone,
    @JsonKey(name: "vehicle_type") required String vehicleType,
//   @JsonKey(name: "otp_number")  required String otpNumber,

    @JsonKey(name: "driver_rate") required double rate,
    required double lat,
    required double lng,
  }) = _DriverDateModel;

  factory DriverDateModel.fromJson(Map<String, dynamic> json) =>
      _$DriverDateModelFromJson(json);
}
