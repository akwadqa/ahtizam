import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_offer_model.freezed.dart';
part 'driver_offer_model.g.dart';

@freezed
abstract class DriverOfferModel with _$DriverOfferModel {
  const factory DriverOfferModel({
    @JsonKey(name: "driver") required String driverId,
    @JsonKey(name: "driver_address") required String driverAddress,
    @JsonKey(name: "driver_email") required String driverEmail,
    @JsonKey(name: "driver_image") required String? driverImage,
    @JsonKey(name: "driver_name") required String driverName,
    @JsonKey(name: "driver_number") required String driverNumber,
    @JsonKey(name: "eta") required String eta,
    @JsonKey(name: "price") required double price,
    @JsonKey(name: "driver_rating") required double driverRating,
    @JsonKey(name: "quick_order_offer_id") required String quickOrderOfferId,
    @JsonKey(name: "vehicle_type") required String vehicleType,
    @JsonKey(name: "vehicle_capacity") required String vehicleCapacity,
    @JsonKey(name: "vehicle_size") required String vehicleSize,
    @JsonKey(name: "vehicle_plate_number") required String? vehiclePlateNumber,

    required double lat,
    required double lng,
    required String status,
    required int available,
  }) = _DriverOfferModel;

  factory DriverOfferModel.fromJson(Map<String, dynamic> json) =>
      _$DriverOfferModelFromJson(json);
}
// lat, lng, rating , available , status
