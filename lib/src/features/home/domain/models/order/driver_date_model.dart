import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_date_model.freezed.dart';
part 'driver_date_model.g.dart';

@freezed
class DriverDateModel with _$DriverDateModel {

  factory DriverDateModel({
   @JsonKey(name: "driver_id") required String? driverId,
    required String status,
//     required String name,
//     required String image,
//     required String phone,
//  @JsonKey(name: "truck_number")   required String truckNumber,
//   @JsonKey(name: "otp_number")  required String otpNumber,
 

//     required double rate,
    required double lat,
    required double lng,

  }) = _DriverDateModel;

  factory DriverDateModel.fromJson(Map<String, dynamic> json) => _$DriverDateModelFromJson(json);
}