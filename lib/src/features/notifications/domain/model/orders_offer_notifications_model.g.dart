// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_offer_notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdersOfferNotificationsModel _$OrdersOfferNotificationsModelFromJson(
  Map<String, dynamic> json,
) => _OrdersOfferNotificationsModel(
  quickOrderOfferId: json['quick_order_offer_id'] as String,
  orderOfferNotificationDetails: OrderOfferNotificationDetails.fromJson(
    json['order_datails'] as Map<String, dynamic>,
  ),
  responseTime: (json['response_time'] as num).toInt(),
  offerSequence: (json['offer_sequence'] as num).toInt(),
  status: json['status'] as String,
  driverDetails: DriverDetailsNotificationModel.fromJson(
    json['driver_details'] as Map<String, dynamic>,
  ),
  passengerDetails: PassengerDetailsNotificationsModel.fromJson(
    json['passenger_details'] as Map<String, dynamic>,
  ),
  creationDate: DateTime.parse(json['creation_date'] as String),
  creationTime: json['creation_time'] as String,
);

Map<String, dynamic> _$OrdersOfferNotificationsModelToJson(
  _OrdersOfferNotificationsModel instance,
) => <String, dynamic>{
  'quick_order_offer_id': instance.quickOrderOfferId,
  'order_datails': instance.orderOfferNotificationDetails,
  'response_time': instance.responseTime,
  'offer_sequence': instance.offerSequence,
  'status': instance.status,
  'driver_details': instance.driverDetails,
  'passenger_details': instance.passengerDetails,
  'creation_date': instance.creationDate.toIso8601String(),
  'creation_time': instance.creationTime,
};

_DriverDetailsNotificationModel _$DriverDetailsNotificationModelFromJson(
  Map<String, dynamic> json,
) => _DriverDetailsNotificationModel(
  assignedDriver: json['driver'] as String,
  fullName: json['full_name'] as String,
  driverPhone: json['driver_phone'] as String,
  profileImage: json['profile_image'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
);

Map<String, dynamic> _$DriverDetailsNotificationModelToJson(
  _DriverDetailsNotificationModel instance,
) => <String, dynamic>{
  'driver': instance.assignedDriver,
  'full_name': instance.fullName,
  'driver_phone': instance.driverPhone,
  'profile_image': instance.profileImage,
  'rating': instance.rating,
};

_PassengerDetailsNotificationsModel
_$PassengerDetailsNotificationsModelFromJson(Map<String, dynamic> json) =>
    _PassengerDetailsNotificationsModel(
      passenger: json['passenger'] as String,
      fullName: json['full_name'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$PassengerDetailsNotificationsModelToJson(
  _PassengerDetailsNotificationsModel instance,
) => <String, dynamic>{
  'passenger': instance.passenger,
  'full_name': instance.fullName,
  'profile_image': instance.profileImage,
};

_OrderOfferNotificationDetails _$OrderOfferNotificationDetailsFromJson(
  Map<String, dynamic> json,
) => _OrderOfferNotificationDetails(
  quickOrderId: json['quick_order'] as String,
  finalFee: (json['final_fare'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderOfferNotificationDetailsToJson(
  _OrderOfferNotificationDetails instance,
) => <String, dynamic>{
  'quick_order': instance.quickOrderId,
  'final_fare': instance.finalFee,
};
