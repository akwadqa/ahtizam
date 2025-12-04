// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'my_order_model.freezed.dart';
// part 'my_order_model.g.dart';

// enum OrderStatus { all, accepted, pending, rejected }

// @freezed
// abstract class MyOrderModel with _$MyOrderModel {
//   const factory MyOrderModel({
//     required String driverName,
//     required String driverImage,
//     required double driverRating,
//     required String otpNumber,
//     required String paymentMethod,
//     required String truckNumber,
//     required String fromAddress,
//     required String toAddress,
//     required double price,
//     required String date,
//     required String time,
//     @LatLngConverter() required LatLng userLocation,
//     @LatLngConverter() required LatLng destinationLocation,
//     required OrderStatus status,
//   }) = _MyOrderModel;

//   factory MyOrderModel.fromJson(Map<String, dynamic> json) =>
//       _$MyOrderModelFromJson(json);
// }
// class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
//   const LatLngConverter();

//   @override
//   LatLng fromJson(Map<String, dynamic> json) => LatLng(
//         (json['latitude'] as num).toDouble(),
//         (json['longitude'] as num).toDouble(),
//       );

//   @override
//   Map<String, dynamic> toJson(LatLng object) => {
//         'latitude': object.latitude,
//         'longitude': object.longitude,
//       };
// }