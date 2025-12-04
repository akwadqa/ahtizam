// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_offer_notifications_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdersOfferNotificationsModel {

@JsonKey(name: 'quick_order_offer_id') String get quickOrderOfferId;@JsonKey(name: 'order_datails') OrderOfferNotificationDetails get orderOfferNotificationDetails;@JsonKey(name: 'response_time') int get responseTime;@JsonKey(name: 'offer_sequence') int get offerSequence; String get status;@JsonKey(name: 'driver_details') DriverDetailsNotificationModel get driverDetails;@JsonKey(name: 'passenger_details') PassengerDetailsNotificationsModel get passengerDetails;@JsonKey(name: "creation_date") DateTime get creationDate;@JsonKey(name: "creation_time") String get creationTime;
/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersOfferNotificationsModelCopyWith<OrdersOfferNotificationsModel> get copyWith => _$OrdersOfferNotificationsModelCopyWithImpl<OrdersOfferNotificationsModel>(this as OrdersOfferNotificationsModel, _$identity);

  /// Serializes this OrdersOfferNotificationsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersOfferNotificationsModel&&(identical(other.quickOrderOfferId, quickOrderOfferId) || other.quickOrderOfferId == quickOrderOfferId)&&(identical(other.orderOfferNotificationDetails, orderOfferNotificationDetails) || other.orderOfferNotificationDetails == orderOfferNotificationDetails)&&(identical(other.responseTime, responseTime) || other.responseTime == responseTime)&&(identical(other.offerSequence, offerSequence) || other.offerSequence == offerSequence)&&(identical(other.status, status) || other.status == status)&&(identical(other.driverDetails, driverDetails) || other.driverDetails == driverDetails)&&(identical(other.passengerDetails, passengerDetails) || other.passengerDetails == passengerDetails)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderOfferId,orderOfferNotificationDetails,responseTime,offerSequence,status,driverDetails,passengerDetails,creationDate,creationTime);

@override
String toString() {
  return 'OrdersOfferNotificationsModel(quickOrderOfferId: $quickOrderOfferId, orderOfferNotificationDetails: $orderOfferNotificationDetails, responseTime: $responseTime, offerSequence: $offerSequence, status: $status, driverDetails: $driverDetails, passengerDetails: $passengerDetails, creationDate: $creationDate, creationTime: $creationTime)';
}


}

/// @nodoc
abstract mixin class $OrdersOfferNotificationsModelCopyWith<$Res>  {
  factory $OrdersOfferNotificationsModelCopyWith(OrdersOfferNotificationsModel value, $Res Function(OrdersOfferNotificationsModel) _then) = _$OrdersOfferNotificationsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'quick_order_offer_id') String quickOrderOfferId,@JsonKey(name: 'order_datails') OrderOfferNotificationDetails orderOfferNotificationDetails,@JsonKey(name: 'response_time') int responseTime,@JsonKey(name: 'offer_sequence') int offerSequence, String status,@JsonKey(name: 'driver_details') DriverDetailsNotificationModel driverDetails,@JsonKey(name: 'passenger_details') PassengerDetailsNotificationsModel passengerDetails,@JsonKey(name: "creation_date") DateTime creationDate,@JsonKey(name: "creation_time") String creationTime
});


$OrderOfferNotificationDetailsCopyWith<$Res> get orderOfferNotificationDetails;$DriverDetailsNotificationModelCopyWith<$Res> get driverDetails;$PassengerDetailsNotificationsModelCopyWith<$Res> get passengerDetails;

}
/// @nodoc
class _$OrdersOfferNotificationsModelCopyWithImpl<$Res>
    implements $OrdersOfferNotificationsModelCopyWith<$Res> {
  _$OrdersOfferNotificationsModelCopyWithImpl(this._self, this._then);

  final OrdersOfferNotificationsModel _self;
  final $Res Function(OrdersOfferNotificationsModel) _then;

/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quickOrderOfferId = null,Object? orderOfferNotificationDetails = null,Object? responseTime = null,Object? offerSequence = null,Object? status = null,Object? driverDetails = null,Object? passengerDetails = null,Object? creationDate = null,Object? creationTime = null,}) {
  return _then(_self.copyWith(
quickOrderOfferId: null == quickOrderOfferId ? _self.quickOrderOfferId : quickOrderOfferId // ignore: cast_nullable_to_non_nullable
as String,orderOfferNotificationDetails: null == orderOfferNotificationDetails ? _self.orderOfferNotificationDetails : orderOfferNotificationDetails // ignore: cast_nullable_to_non_nullable
as OrderOfferNotificationDetails,responseTime: null == responseTime ? _self.responseTime : responseTime // ignore: cast_nullable_to_non_nullable
as int,offerSequence: null == offerSequence ? _self.offerSequence : offerSequence // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,driverDetails: null == driverDetails ? _self.driverDetails : driverDetails // ignore: cast_nullable_to_non_nullable
as DriverDetailsNotificationModel,passengerDetails: null == passengerDetails ? _self.passengerDetails : passengerDetails // ignore: cast_nullable_to_non_nullable
as PassengerDetailsNotificationsModel,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderOfferNotificationDetailsCopyWith<$Res> get orderOfferNotificationDetails {
  
  return $OrderOfferNotificationDetailsCopyWith<$Res>(_self.orderOfferNotificationDetails, (value) {
    return _then(_self.copyWith(orderOfferNotificationDetails: value));
  });
}/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverDetailsNotificationModelCopyWith<$Res> get driverDetails {
  
  return $DriverDetailsNotificationModelCopyWith<$Res>(_self.driverDetails, (value) {
    return _then(_self.copyWith(driverDetails: value));
  });
}/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerDetailsNotificationsModelCopyWith<$Res> get passengerDetails {
  
  return $PassengerDetailsNotificationsModelCopyWith<$Res>(_self.passengerDetails, (value) {
    return _then(_self.copyWith(passengerDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrdersOfferNotificationsModel].
extension OrdersOfferNotificationsModelPatterns on OrdersOfferNotificationsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersOfferNotificationsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersOfferNotificationsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersOfferNotificationsModel value)  $default,){
final _that = this;
switch (_that) {
case _OrdersOfferNotificationsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersOfferNotificationsModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersOfferNotificationsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_order_offer_id')  String quickOrderOfferId, @JsonKey(name: 'order_datails')  OrderOfferNotificationDetails orderOfferNotificationDetails, @JsonKey(name: 'response_time')  int responseTime, @JsonKey(name: 'offer_sequence')  int offerSequence,  String status, @JsonKey(name: 'driver_details')  DriverDetailsNotificationModel driverDetails, @JsonKey(name: 'passenger_details')  PassengerDetailsNotificationsModel passengerDetails, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "creation_time")  String creationTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersOfferNotificationsModel() when $default != null:
return $default(_that.quickOrderOfferId,_that.orderOfferNotificationDetails,_that.responseTime,_that.offerSequence,_that.status,_that.driverDetails,_that.passengerDetails,_that.creationDate,_that.creationTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_order_offer_id')  String quickOrderOfferId, @JsonKey(name: 'order_datails')  OrderOfferNotificationDetails orderOfferNotificationDetails, @JsonKey(name: 'response_time')  int responseTime, @JsonKey(name: 'offer_sequence')  int offerSequence,  String status, @JsonKey(name: 'driver_details')  DriverDetailsNotificationModel driverDetails, @JsonKey(name: 'passenger_details')  PassengerDetailsNotificationsModel passengerDetails, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "creation_time")  String creationTime)  $default,) {final _that = this;
switch (_that) {
case _OrdersOfferNotificationsModel():
return $default(_that.quickOrderOfferId,_that.orderOfferNotificationDetails,_that.responseTime,_that.offerSequence,_that.status,_that.driverDetails,_that.passengerDetails,_that.creationDate,_that.creationTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'quick_order_offer_id')  String quickOrderOfferId, @JsonKey(name: 'order_datails')  OrderOfferNotificationDetails orderOfferNotificationDetails, @JsonKey(name: 'response_time')  int responseTime, @JsonKey(name: 'offer_sequence')  int offerSequence,  String status, @JsonKey(name: 'driver_details')  DriverDetailsNotificationModel driverDetails, @JsonKey(name: 'passenger_details')  PassengerDetailsNotificationsModel passengerDetails, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "creation_time")  String creationTime)?  $default,) {final _that = this;
switch (_that) {
case _OrdersOfferNotificationsModel() when $default != null:
return $default(_that.quickOrderOfferId,_that.orderOfferNotificationDetails,_that.responseTime,_that.offerSequence,_that.status,_that.driverDetails,_that.passengerDetails,_that.creationDate,_that.creationTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersOfferNotificationsModel implements OrdersOfferNotificationsModel {
  const _OrdersOfferNotificationsModel({@JsonKey(name: 'quick_order_offer_id') required this.quickOrderOfferId, @JsonKey(name: 'order_datails') required this.orderOfferNotificationDetails, @JsonKey(name: 'response_time') required this.responseTime, @JsonKey(name: 'offer_sequence') required this.offerSequence, required this.status, @JsonKey(name: 'driver_details') required this.driverDetails, @JsonKey(name: 'passenger_details') required this.passengerDetails, @JsonKey(name: "creation_date") required this.creationDate, @JsonKey(name: "creation_time") required this.creationTime});
  factory _OrdersOfferNotificationsModel.fromJson(Map<String, dynamic> json) => _$OrdersOfferNotificationsModelFromJson(json);

@override@JsonKey(name: 'quick_order_offer_id') final  String quickOrderOfferId;
@override@JsonKey(name: 'order_datails') final  OrderOfferNotificationDetails orderOfferNotificationDetails;
@override@JsonKey(name: 'response_time') final  int responseTime;
@override@JsonKey(name: 'offer_sequence') final  int offerSequence;
@override final  String status;
@override@JsonKey(name: 'driver_details') final  DriverDetailsNotificationModel driverDetails;
@override@JsonKey(name: 'passenger_details') final  PassengerDetailsNotificationsModel passengerDetails;
@override@JsonKey(name: "creation_date") final  DateTime creationDate;
@override@JsonKey(name: "creation_time") final  String creationTime;

/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersOfferNotificationsModelCopyWith<_OrdersOfferNotificationsModel> get copyWith => __$OrdersOfferNotificationsModelCopyWithImpl<_OrdersOfferNotificationsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersOfferNotificationsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersOfferNotificationsModel&&(identical(other.quickOrderOfferId, quickOrderOfferId) || other.quickOrderOfferId == quickOrderOfferId)&&(identical(other.orderOfferNotificationDetails, orderOfferNotificationDetails) || other.orderOfferNotificationDetails == orderOfferNotificationDetails)&&(identical(other.responseTime, responseTime) || other.responseTime == responseTime)&&(identical(other.offerSequence, offerSequence) || other.offerSequence == offerSequence)&&(identical(other.status, status) || other.status == status)&&(identical(other.driverDetails, driverDetails) || other.driverDetails == driverDetails)&&(identical(other.passengerDetails, passengerDetails) || other.passengerDetails == passengerDetails)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderOfferId,orderOfferNotificationDetails,responseTime,offerSequence,status,driverDetails,passengerDetails,creationDate,creationTime);

@override
String toString() {
  return 'OrdersOfferNotificationsModel(quickOrderOfferId: $quickOrderOfferId, orderOfferNotificationDetails: $orderOfferNotificationDetails, responseTime: $responseTime, offerSequence: $offerSequence, status: $status, driverDetails: $driverDetails, passengerDetails: $passengerDetails, creationDate: $creationDate, creationTime: $creationTime)';
}


}

/// @nodoc
abstract mixin class _$OrdersOfferNotificationsModelCopyWith<$Res> implements $OrdersOfferNotificationsModelCopyWith<$Res> {
  factory _$OrdersOfferNotificationsModelCopyWith(_OrdersOfferNotificationsModel value, $Res Function(_OrdersOfferNotificationsModel) _then) = __$OrdersOfferNotificationsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'quick_order_offer_id') String quickOrderOfferId,@JsonKey(name: 'order_datails') OrderOfferNotificationDetails orderOfferNotificationDetails,@JsonKey(name: 'response_time') int responseTime,@JsonKey(name: 'offer_sequence') int offerSequence, String status,@JsonKey(name: 'driver_details') DriverDetailsNotificationModel driverDetails,@JsonKey(name: 'passenger_details') PassengerDetailsNotificationsModel passengerDetails,@JsonKey(name: "creation_date") DateTime creationDate,@JsonKey(name: "creation_time") String creationTime
});


@override $OrderOfferNotificationDetailsCopyWith<$Res> get orderOfferNotificationDetails;@override $DriverDetailsNotificationModelCopyWith<$Res> get driverDetails;@override $PassengerDetailsNotificationsModelCopyWith<$Res> get passengerDetails;

}
/// @nodoc
class __$OrdersOfferNotificationsModelCopyWithImpl<$Res>
    implements _$OrdersOfferNotificationsModelCopyWith<$Res> {
  __$OrdersOfferNotificationsModelCopyWithImpl(this._self, this._then);

  final _OrdersOfferNotificationsModel _self;
  final $Res Function(_OrdersOfferNotificationsModel) _then;

/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quickOrderOfferId = null,Object? orderOfferNotificationDetails = null,Object? responseTime = null,Object? offerSequence = null,Object? status = null,Object? driverDetails = null,Object? passengerDetails = null,Object? creationDate = null,Object? creationTime = null,}) {
  return _then(_OrdersOfferNotificationsModel(
quickOrderOfferId: null == quickOrderOfferId ? _self.quickOrderOfferId : quickOrderOfferId // ignore: cast_nullable_to_non_nullable
as String,orderOfferNotificationDetails: null == orderOfferNotificationDetails ? _self.orderOfferNotificationDetails : orderOfferNotificationDetails // ignore: cast_nullable_to_non_nullable
as OrderOfferNotificationDetails,responseTime: null == responseTime ? _self.responseTime : responseTime // ignore: cast_nullable_to_non_nullable
as int,offerSequence: null == offerSequence ? _self.offerSequence : offerSequence // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,driverDetails: null == driverDetails ? _self.driverDetails : driverDetails // ignore: cast_nullable_to_non_nullable
as DriverDetailsNotificationModel,passengerDetails: null == passengerDetails ? _self.passengerDetails : passengerDetails // ignore: cast_nullable_to_non_nullable
as PassengerDetailsNotificationsModel,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderOfferNotificationDetailsCopyWith<$Res> get orderOfferNotificationDetails {
  
  return $OrderOfferNotificationDetailsCopyWith<$Res>(_self.orderOfferNotificationDetails, (value) {
    return _then(_self.copyWith(orderOfferNotificationDetails: value));
  });
}/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverDetailsNotificationModelCopyWith<$Res> get driverDetails {
  
  return $DriverDetailsNotificationModelCopyWith<$Res>(_self.driverDetails, (value) {
    return _then(_self.copyWith(driverDetails: value));
  });
}/// Create a copy of OrdersOfferNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerDetailsNotificationsModelCopyWith<$Res> get passengerDetails {
  
  return $PassengerDetailsNotificationsModelCopyWith<$Res>(_self.passengerDetails, (value) {
    return _then(_self.copyWith(passengerDetails: value));
  });
}
}


/// @nodoc
mixin _$DriverDetailsNotificationModel {

@JsonKey(name: "driver") String get assignedDriver;@JsonKey(name: "full_name") String get fullName;@JsonKey(name: "driver_phone") String get driverPhone;@JsonKey(name: "profile_image") String? get profileImage; int? get rating;
/// Create a copy of DriverDetailsNotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverDetailsNotificationModelCopyWith<DriverDetailsNotificationModel> get copyWith => _$DriverDetailsNotificationModelCopyWithImpl<DriverDetailsNotificationModel>(this as DriverDetailsNotificationModel, _$identity);

  /// Serializes this DriverDetailsNotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverDetailsNotificationModel&&(identical(other.assignedDriver, assignedDriver) || other.assignedDriver == assignedDriver)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignedDriver,fullName,driverPhone,profileImage,rating);

@override
String toString() {
  return 'DriverDetailsNotificationModel(assignedDriver: $assignedDriver, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $DriverDetailsNotificationModelCopyWith<$Res>  {
  factory $DriverDetailsNotificationModelCopyWith(DriverDetailsNotificationModel value, $Res Function(DriverDetailsNotificationModel) _then) = _$DriverDetailsNotificationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "driver") String assignedDriver,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "driver_phone") String driverPhone,@JsonKey(name: "profile_image") String? profileImage, int? rating
});




}
/// @nodoc
class _$DriverDetailsNotificationModelCopyWithImpl<$Res>
    implements $DriverDetailsNotificationModelCopyWith<$Res> {
  _$DriverDetailsNotificationModelCopyWithImpl(this._self, this._then);

  final DriverDetailsNotificationModel _self;
  final $Res Function(DriverDetailsNotificationModel) _then;

/// Create a copy of DriverDetailsNotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignedDriver = null,Object? fullName = null,Object? driverPhone = null,Object? profileImage = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
assignedDriver: null == assignedDriver ? _self.assignedDriver : assignedDriver // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,driverPhone: null == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverDetailsNotificationModel].
extension DriverDetailsNotificationModelPatterns on DriverDetailsNotificationModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverDetailsNotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverDetailsNotificationModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverDetailsNotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverDetailsNotificationModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverDetailsNotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverDetailsNotificationModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "driver")  String assignedDriver, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "driver_phone")  String driverPhone, @JsonKey(name: "profile_image")  String? profileImage,  int? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverDetailsNotificationModel() when $default != null:
return $default(_that.assignedDriver,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "driver")  String assignedDriver, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "driver_phone")  String driverPhone, @JsonKey(name: "profile_image")  String? profileImage,  int? rating)  $default,) {final _that = this;
switch (_that) {
case _DriverDetailsNotificationModel():
return $default(_that.assignedDriver,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "driver")  String assignedDriver, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "driver_phone")  String driverPhone, @JsonKey(name: "profile_image")  String? profileImage,  int? rating)?  $default,) {final _that = this;
switch (_that) {
case _DriverDetailsNotificationModel() when $default != null:
return $default(_that.assignedDriver,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverDetailsNotificationModel implements DriverDetailsNotificationModel {
  const _DriverDetailsNotificationModel({@JsonKey(name: "driver") required this.assignedDriver, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "driver_phone") required this.driverPhone, @JsonKey(name: "profile_image") this.profileImage, required this.rating});
  factory _DriverDetailsNotificationModel.fromJson(Map<String, dynamic> json) => _$DriverDetailsNotificationModelFromJson(json);

@override@JsonKey(name: "driver") final  String assignedDriver;
@override@JsonKey(name: "full_name") final  String fullName;
@override@JsonKey(name: "driver_phone") final  String driverPhone;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override final  int? rating;

/// Create a copy of DriverDetailsNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverDetailsNotificationModelCopyWith<_DriverDetailsNotificationModel> get copyWith => __$DriverDetailsNotificationModelCopyWithImpl<_DriverDetailsNotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverDetailsNotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverDetailsNotificationModel&&(identical(other.assignedDriver, assignedDriver) || other.assignedDriver == assignedDriver)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignedDriver,fullName,driverPhone,profileImage,rating);

@override
String toString() {
  return 'DriverDetailsNotificationModel(assignedDriver: $assignedDriver, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$DriverDetailsNotificationModelCopyWith<$Res> implements $DriverDetailsNotificationModelCopyWith<$Res> {
  factory _$DriverDetailsNotificationModelCopyWith(_DriverDetailsNotificationModel value, $Res Function(_DriverDetailsNotificationModel) _then) = __$DriverDetailsNotificationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "driver") String assignedDriver,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "driver_phone") String driverPhone,@JsonKey(name: "profile_image") String? profileImage, int? rating
});




}
/// @nodoc
class __$DriverDetailsNotificationModelCopyWithImpl<$Res>
    implements _$DriverDetailsNotificationModelCopyWith<$Res> {
  __$DriverDetailsNotificationModelCopyWithImpl(this._self, this._then);

  final _DriverDetailsNotificationModel _self;
  final $Res Function(_DriverDetailsNotificationModel) _then;

/// Create a copy of DriverDetailsNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignedDriver = null,Object? fullName = null,Object? driverPhone = null,Object? profileImage = freezed,Object? rating = freezed,}) {
  return _then(_DriverDetailsNotificationModel(
assignedDriver: null == assignedDriver ? _self.assignedDriver : assignedDriver // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,driverPhone: null == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PassengerDetailsNotificationsModel {

 String get passenger;@JsonKey(name: "full_name") String get fullName;@JsonKey(name: "profile_image") String? get profileImage;
/// Create a copy of PassengerDetailsNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassengerDetailsNotificationsModelCopyWith<PassengerDetailsNotificationsModel> get copyWith => _$PassengerDetailsNotificationsModelCopyWithImpl<PassengerDetailsNotificationsModel>(this as PassengerDetailsNotificationsModel, _$identity);

  /// Serializes this PassengerDetailsNotificationsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassengerDetailsNotificationsModel&&(identical(other.passenger, passenger) || other.passenger == passenger)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passenger,fullName,profileImage);

@override
String toString() {
  return 'PassengerDetailsNotificationsModel(passenger: $passenger, fullName: $fullName, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class $PassengerDetailsNotificationsModelCopyWith<$Res>  {
  factory $PassengerDetailsNotificationsModelCopyWith(PassengerDetailsNotificationsModel value, $Res Function(PassengerDetailsNotificationsModel) _then) = _$PassengerDetailsNotificationsModelCopyWithImpl;
@useResult
$Res call({
 String passenger,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class _$PassengerDetailsNotificationsModelCopyWithImpl<$Res>
    implements $PassengerDetailsNotificationsModelCopyWith<$Res> {
  _$PassengerDetailsNotificationsModelCopyWithImpl(this._self, this._then);

  final PassengerDetailsNotificationsModel _self;
  final $Res Function(PassengerDetailsNotificationsModel) _then;

/// Create a copy of PassengerDetailsNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passenger = null,Object? fullName = null,Object? profileImage = freezed,}) {
  return _then(_self.copyWith(
passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PassengerDetailsNotificationsModel].
extension PassengerDetailsNotificationsModelPatterns on PassengerDetailsNotificationsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassengerDetailsNotificationsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassengerDetailsNotificationsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassengerDetailsNotificationsModel value)  $default,){
final _that = this;
switch (_that) {
case _PassengerDetailsNotificationsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassengerDetailsNotificationsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PassengerDetailsNotificationsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String passenger, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "profile_image")  String? profileImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassengerDetailsNotificationsModel() when $default != null:
return $default(_that.passenger,_that.fullName,_that.profileImage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String passenger, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "profile_image")  String? profileImage)  $default,) {final _that = this;
switch (_that) {
case _PassengerDetailsNotificationsModel():
return $default(_that.passenger,_that.fullName,_that.profileImage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String passenger, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "profile_image")  String? profileImage)?  $default,) {final _that = this;
switch (_that) {
case _PassengerDetailsNotificationsModel() when $default != null:
return $default(_that.passenger,_that.fullName,_that.profileImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PassengerDetailsNotificationsModel implements PassengerDetailsNotificationsModel {
  const _PassengerDetailsNotificationsModel({required this.passenger, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "profile_image") this.profileImage});
  factory _PassengerDetailsNotificationsModel.fromJson(Map<String, dynamic> json) => _$PassengerDetailsNotificationsModelFromJson(json);

@override final  String passenger;
@override@JsonKey(name: "full_name") final  String fullName;
@override@JsonKey(name: "profile_image") final  String? profileImage;

/// Create a copy of PassengerDetailsNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassengerDetailsNotificationsModelCopyWith<_PassengerDetailsNotificationsModel> get copyWith => __$PassengerDetailsNotificationsModelCopyWithImpl<_PassengerDetailsNotificationsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PassengerDetailsNotificationsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassengerDetailsNotificationsModel&&(identical(other.passenger, passenger) || other.passenger == passenger)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passenger,fullName,profileImage);

@override
String toString() {
  return 'PassengerDetailsNotificationsModel(passenger: $passenger, fullName: $fullName, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class _$PassengerDetailsNotificationsModelCopyWith<$Res> implements $PassengerDetailsNotificationsModelCopyWith<$Res> {
  factory _$PassengerDetailsNotificationsModelCopyWith(_PassengerDetailsNotificationsModel value, $Res Function(_PassengerDetailsNotificationsModel) _then) = __$PassengerDetailsNotificationsModelCopyWithImpl;
@override @useResult
$Res call({
 String passenger,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class __$PassengerDetailsNotificationsModelCopyWithImpl<$Res>
    implements _$PassengerDetailsNotificationsModelCopyWith<$Res> {
  __$PassengerDetailsNotificationsModelCopyWithImpl(this._self, this._then);

  final _PassengerDetailsNotificationsModel _self;
  final $Res Function(_PassengerDetailsNotificationsModel) _then;

/// Create a copy of PassengerDetailsNotificationsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passenger = null,Object? fullName = null,Object? profileImage = freezed,}) {
  return _then(_PassengerDetailsNotificationsModel(
passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderOfferNotificationDetails {

@JsonKey(name: 'quick_order') String get quickOrderId;@JsonKey(name: "final_fare") double? get finalFee;
/// Create a copy of OrderOfferNotificationDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderOfferNotificationDetailsCopyWith<OrderOfferNotificationDetails> get copyWith => _$OrderOfferNotificationDetailsCopyWithImpl<OrderOfferNotificationDetails>(this as OrderOfferNotificationDetails, _$identity);

  /// Serializes this OrderOfferNotificationDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderOfferNotificationDetails&&(identical(other.quickOrderId, quickOrderId) || other.quickOrderId == quickOrderId)&&(identical(other.finalFee, finalFee) || other.finalFee == finalFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderId,finalFee);

@override
String toString() {
  return 'OrderOfferNotificationDetails(quickOrderId: $quickOrderId, finalFee: $finalFee)';
}


}

/// @nodoc
abstract mixin class $OrderOfferNotificationDetailsCopyWith<$Res>  {
  factory $OrderOfferNotificationDetailsCopyWith(OrderOfferNotificationDetails value, $Res Function(OrderOfferNotificationDetails) _then) = _$OrderOfferNotificationDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'quick_order') String quickOrderId,@JsonKey(name: "final_fare") double? finalFee
});




}
/// @nodoc
class _$OrderOfferNotificationDetailsCopyWithImpl<$Res>
    implements $OrderOfferNotificationDetailsCopyWith<$Res> {
  _$OrderOfferNotificationDetailsCopyWithImpl(this._self, this._then);

  final OrderOfferNotificationDetails _self;
  final $Res Function(OrderOfferNotificationDetails) _then;

/// Create a copy of OrderOfferNotificationDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quickOrderId = null,Object? finalFee = freezed,}) {
  return _then(_self.copyWith(
quickOrderId: null == quickOrderId ? _self.quickOrderId : quickOrderId // ignore: cast_nullable_to_non_nullable
as String,finalFee: freezed == finalFee ? _self.finalFee : finalFee // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderOfferNotificationDetails].
extension OrderOfferNotificationDetailsPatterns on OrderOfferNotificationDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderOfferNotificationDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderOfferNotificationDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderOfferNotificationDetails value)  $default,){
final _that = this;
switch (_that) {
case _OrderOfferNotificationDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderOfferNotificationDetails value)?  $default,){
final _that = this;
switch (_that) {
case _OrderOfferNotificationDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_order')  String quickOrderId, @JsonKey(name: "final_fare")  double? finalFee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderOfferNotificationDetails() when $default != null:
return $default(_that.quickOrderId,_that.finalFee);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_order')  String quickOrderId, @JsonKey(name: "final_fare")  double? finalFee)  $default,) {final _that = this;
switch (_that) {
case _OrderOfferNotificationDetails():
return $default(_that.quickOrderId,_that.finalFee);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'quick_order')  String quickOrderId, @JsonKey(name: "final_fare")  double? finalFee)?  $default,) {final _that = this;
switch (_that) {
case _OrderOfferNotificationDetails() when $default != null:
return $default(_that.quickOrderId,_that.finalFee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderOfferNotificationDetails implements OrderOfferNotificationDetails {
  const _OrderOfferNotificationDetails({@JsonKey(name: 'quick_order') required this.quickOrderId, @JsonKey(name: "final_fare") this.finalFee});
  factory _OrderOfferNotificationDetails.fromJson(Map<String, dynamic> json) => _$OrderOfferNotificationDetailsFromJson(json);

@override@JsonKey(name: 'quick_order') final  String quickOrderId;
@override@JsonKey(name: "final_fare") final  double? finalFee;

/// Create a copy of OrderOfferNotificationDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderOfferNotificationDetailsCopyWith<_OrderOfferNotificationDetails> get copyWith => __$OrderOfferNotificationDetailsCopyWithImpl<_OrderOfferNotificationDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderOfferNotificationDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderOfferNotificationDetails&&(identical(other.quickOrderId, quickOrderId) || other.quickOrderId == quickOrderId)&&(identical(other.finalFee, finalFee) || other.finalFee == finalFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderId,finalFee);

@override
String toString() {
  return 'OrderOfferNotificationDetails(quickOrderId: $quickOrderId, finalFee: $finalFee)';
}


}

/// @nodoc
abstract mixin class _$OrderOfferNotificationDetailsCopyWith<$Res> implements $OrderOfferNotificationDetailsCopyWith<$Res> {
  factory _$OrderOfferNotificationDetailsCopyWith(_OrderOfferNotificationDetails value, $Res Function(_OrderOfferNotificationDetails) _then) = __$OrderOfferNotificationDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'quick_order') String quickOrderId,@JsonKey(name: "final_fare") double? finalFee
});




}
/// @nodoc
class __$OrderOfferNotificationDetailsCopyWithImpl<$Res>
    implements _$OrderOfferNotificationDetailsCopyWith<$Res> {
  __$OrderOfferNotificationDetailsCopyWithImpl(this._self, this._then);

  final _OrderOfferNotificationDetails _self;
  final $Res Function(_OrderOfferNotificationDetails) _then;

/// Create a copy of OrderOfferNotificationDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quickOrderId = null,Object? finalFee = freezed,}) {
  return _then(_OrderOfferNotificationDetails(
quickOrderId: null == quickOrderId ? _self.quickOrderId : quickOrderId // ignore: cast_nullable_to_non_nullable
as String,finalFee: freezed == finalFee ? _self.finalFee : finalFee // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
