import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_quick_order_model.freezed.dart';
part 'driver_quick_order_model.g.dart';

@freezed
abstract class DriverQuickOrderModel with _$DriverQuickOrderModel {
  factory DriverQuickOrderModel({
    @JsonKey(name: "driver_id") required String? driverId,
    @JsonKey(name: "driver_email") required String? driverEmail,
    @JsonKey(name: "driver_address") required String? driverAddress,

    required String status,
    required int available,
    @JsonKey(name: "driver_name") required String name,
    @JsonKey(name: "driver_image") String? image,
    @JsonKey(name: "driver_number") required String phone,
    @JsonKey(name: "vehicle_type") required String? vehicleType,
    @JsonKey(name: "vehicle_plate_number") required String? vehiclePlateNumber,
//   @JsonKey(name: "otp_number")  required String otpNumber,

    @JsonKey(name: "driver_rating") required double rate,
    required double? lat,
    required double? lng,
  }) = _DriverQuickOrderModel;

  factory DriverQuickOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DriverQuickOrderModelFromJson(json);
}
// {driver_email: driverben@gmail.com, driver_id: DR-25-1046, driver_image: /files/7ae9f5fc-829b-4240-9158-57a694b535ae5093745527137532676.jpg, driver_name: driver ben10, driver_number: 55115522, driver_rate: 0.2, vehicle_type: Regular flatbed truck}

// Received order details: {driver_data: {available: 1, driver_address: Shop 184/2, Souq Waqif, الدوحة، Qatar, driver_email: gavi@test.qa, driver_id: DR-25-0010, driver_image: /files/669f941a-28d9-49cd-9f8a-7c468ea022bd3880894954061501377.jpg, driver_name: gavi, driver_number: 55112244, driver_rating: 0.57, lat: 25.2879817, lng: 51.5328817, status: Online, vehicle_capacity: 1200, vehicle_plate_number: 748393, vehicle_size: 5000, vehicle_type: Regular flatbed truck}, offers: null, order_status: accepted}