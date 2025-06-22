import 'package:ahtizam/src/features/my_order_details/domain/model/driver_details_model.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/fare_details_model.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/order_location_model.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/passenger_details_model.dart';
import 'package:flutter_google_places_hoc081098/google_maps_webservice_places.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'my_order_details_model.freezed.dart';
part 'my_order_details_model.g.dart';
// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

// MyOrderDetailsModel orderDetailsFromJson(String str) => MyOrderDetailsModel.fromJson(json.decode(str));

// String orderDetailsToJson(MyOrderDetailsModel data) => json.encode(data.toJson());

@freezed
class MyOrderDetailsModel with _$MyOrderDetailsModel {
  const factory MyOrderDetailsModel({
    @JsonKey(name: 'quick_order_id') required String quickOrderId,
    required String status,
    @JsonKey(name: 'driver_details') required DriverDetails driverDetails,
    @JsonKey(name: 'passenger_details')
    required PassengerDetails passengerDetails,
    @JsonKey(name: "passenger_location") required OrderLocationModel passengerLocation,
    @JsonKey(name: "destination_location")
    required OrderLocationModel destinationLocation,
    @JsonKey(name: "map_image")  String? mapImage,
    @JsonKey(name: "service_type") required String serviceType,
    @JsonKey(name: "payment_method") required String paymentMethod,
    @JsonKey(name: "coupon_code")  String? couponCode,
    @JsonKey(name: "fare_details") required FareDetails fareDetails,
    @JsonKey(name: "creation_date") required DateTime creationDate,
    @JsonKey(name: "creation_time") required String creationTime,
    @JsonKey(name: "start_time") required String startTime,
    @JsonKey(name: "end_time") required String endTime,
  }) = _MyOrderDetailsModel;

  factory MyOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDetailsModelFromJson(json);
}

// @freezed
// class Location with _$Location {
//     const factory Location({
//         required double latitude,
//         required double longitude,
//         required String address,
//     }) = _Location;

//     factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
// }

// @freezed
// class DriverDetails with _$DriverDetails {
//     const factory DriverDetails({
//         required DateTime assignedDate,
//         required String assignedTime,
//         required String assignedDriver,
//         required String fullName,
//         required String profileImage,
//         required int rating,
//     }) = _DriverDetails;

//     factory DriverDetails.fromJson(Map<String, dynamic> json) => _$DriverDetailsFromJson(json);
// }

// @freezed
// class FareDetails with _$FareDetails {
//     const factory FareDetails({
//         required double baseFare,
//         required int discountAmount,
//         required double taxFee,
//         required double finalFare,
//     }) = _FareDetails;

//     factory FareDetails.fromJson(Map<String, dynamic> json) => _$FareDetailsFromJson(json);
// }

// @freezed
// class PassengerDetails with _$PassengerDetails {
//     const factory PassengerDetails({
//         required String passenger,
//         required String fullName,
//         required String profileImage,
//     }) = _PassengerDetails;

//     factory PassengerDetails.fromJson(Map<String, dynamic> json) => _$PassengerDetailsFromJson(json);
// }
