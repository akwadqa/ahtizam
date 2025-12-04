
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_offer_notifications_model.freezed.dart';
part 'orders_offer_notifications_model.g.dart';
@freezed
abstract class OrdersOfferNotificationsModel with _$OrdersOfferNotificationsModel {
  const factory OrdersOfferNotificationsModel({
    @JsonKey(name: 'quick_order_offer_id') required String quickOrderOfferId,
    @JsonKey(name: 'order_datails') required OrderOfferNotificationDetails orderOfferNotificationDetails,
    @JsonKey(name: 'response_time') required int responseTime,
    @JsonKey(name: 'offer_sequence') required int offerSequence,
    required String status,
    @JsonKey(name: 'driver_details') required DriverDetailsNotificationModel driverDetails,
    @JsonKey(name: 'passenger_details')
    required PassengerDetailsNotificationsModel passengerDetails,

    @JsonKey(name: "creation_date") required DateTime creationDate,
    @JsonKey(name: "creation_time") required String creationTime,
  }) = _OrdersOfferNotificationsModel;

  factory OrdersOfferNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersOfferNotificationsModelFromJson(json);
}

@freezed
abstract class DriverDetailsNotificationModel with _$DriverDetailsNotificationModel {
  const factory DriverDetailsNotificationModel({
    @JsonKey(name: "driver") required String assignedDriver,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "driver_phone") required String driverPhone,
    @JsonKey(name: "profile_image")  String? profileImage,
    required int? rating,
  }) = _DriverDetailsNotificationModel;

  factory DriverDetailsNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsNotificationModelFromJson(json);
}

@freezed
abstract class PassengerDetailsNotificationsModel with _$PassengerDetailsNotificationsModel {
  const factory PassengerDetailsNotificationsModel({
    required String passenger,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "profile_image")  String? profileImage,

  }) = _PassengerDetailsNotificationsModel;

  factory PassengerDetailsNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$PassengerDetailsNotificationsModelFromJson(json);
}
@freezed
abstract class OrderOfferNotificationDetails with _$OrderOfferNotificationDetails {
  const factory OrderOfferNotificationDetails({
    @JsonKey(name: 'quick_order') required String quickOrderId,
    @JsonKey(name: "final_fare")  double? finalFee,

  }) = _OrderOfferNotificationDetails;

  factory OrderOfferNotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderOfferNotificationDetailsFromJson(json);
}
