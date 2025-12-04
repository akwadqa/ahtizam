// import 'package:ahtizam/src/utils/geo_point_converter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'order_model.freezed.dart';
// part 'order_model.g.dart';

// @freezed
// abstract class OrderModel with _$OrderModel {
//   const factory OrderModel({
//     required String id,
//     @GeoPointConverter() required GeoPoint pickupLocation,
//     @GeoPointConverter() required GeoPoint workshopLocation,
//     required String truckType,
//     required String status,
//     String? assignedDriverId,
//     required DateTime createdAt,
//     required double price,
//   }) = _OrderModel;

//   factory OrderModel.fromJson(Map<String, dynamic> json) =>
//       _$OrderModelFromJson(json);
// }
