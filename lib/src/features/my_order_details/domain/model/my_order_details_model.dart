import 'package:ahtizam/src/features/my_order_details/domain/model/driver_details_model.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/fare_details_model.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/order_location_model.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/passenger_details_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_order_details_model.freezed.dart';
part 'my_order_details_model.g.dart';
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