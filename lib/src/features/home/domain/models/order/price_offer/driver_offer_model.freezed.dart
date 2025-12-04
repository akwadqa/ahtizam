// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverOfferModel {

@JsonKey(name: "driver") String get driverId;@JsonKey(name: "driver_address") String get driverAddress;@JsonKey(name: "driver_email") String get driverEmail;@JsonKey(name: "driver_image") String? get driverImage;@JsonKey(name: "driver_name") String get driverName;@JsonKey(name: "driver_number") String get driverNumber;@JsonKey(name: "eta") String get eta;@JsonKey(name: "price") double get price;@JsonKey(name: "driver_rating") double get driverRating;@JsonKey(name: "quick_order_offer_id") String get quickOrderOfferId;@JsonKey(name: "vehicle_type") String get vehicleType;@JsonKey(name: "vehicle_capacity") String get vehicleCapacity;@JsonKey(name: "vehicle_size") String get vehicleSize;@JsonKey(name: "vehicle_plate_number") String? get vehiclePlateNumber; double get lat; double get lng; String get status; int get available;
/// Create a copy of DriverOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverOfferModelCopyWith<DriverOfferModel> get copyWith => _$DriverOfferModelCopyWithImpl<DriverOfferModel>(this as DriverOfferModel, _$identity);

  /// Serializes this DriverOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverOfferModel&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverAddress, driverAddress) || other.driverAddress == driverAddress)&&(identical(other.driverEmail, driverEmail) || other.driverEmail == driverEmail)&&(identical(other.driverImage, driverImage) || other.driverImage == driverImage)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverNumber, driverNumber) || other.driverNumber == driverNumber)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.price, price) || other.price == price)&&(identical(other.driverRating, driverRating) || other.driverRating == driverRating)&&(identical(other.quickOrderOfferId, quickOrderOfferId) || other.quickOrderOfferId == quickOrderOfferId)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.vehicleSize, vehicleSize) || other.vehicleSize == vehicleSize)&&(identical(other.vehiclePlateNumber, vehiclePlateNumber) || other.vehiclePlateNumber == vehiclePlateNumber)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.status, status) || other.status == status)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,driverAddress,driverEmail,driverImage,driverName,driverNumber,eta,price,driverRating,quickOrderOfferId,vehicleType,vehicleCapacity,vehicleSize,vehiclePlateNumber,lat,lng,status,available);

@override
String toString() {
  return 'DriverOfferModel(driverId: $driverId, driverAddress: $driverAddress, driverEmail: $driverEmail, driverImage: $driverImage, driverName: $driverName, driverNumber: $driverNumber, eta: $eta, price: $price, driverRating: $driverRating, quickOrderOfferId: $quickOrderOfferId, vehicleType: $vehicleType, vehicleCapacity: $vehicleCapacity, vehicleSize: $vehicleSize, vehiclePlateNumber: $vehiclePlateNumber, lat: $lat, lng: $lng, status: $status, available: $available)';
}


}

/// @nodoc
abstract mixin class $DriverOfferModelCopyWith<$Res>  {
  factory $DriverOfferModelCopyWith(DriverOfferModel value, $Res Function(DriverOfferModel) _then) = _$DriverOfferModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "driver") String driverId,@JsonKey(name: "driver_address") String driverAddress,@JsonKey(name: "driver_email") String driverEmail,@JsonKey(name: "driver_image") String? driverImage,@JsonKey(name: "driver_name") String driverName,@JsonKey(name: "driver_number") String driverNumber,@JsonKey(name: "eta") String eta,@JsonKey(name: "price") double price,@JsonKey(name: "driver_rating") double driverRating,@JsonKey(name: "quick_order_offer_id") String quickOrderOfferId,@JsonKey(name: "vehicle_type") String vehicleType,@JsonKey(name: "vehicle_capacity") String vehicleCapacity,@JsonKey(name: "vehicle_size") String vehicleSize,@JsonKey(name: "vehicle_plate_number") String? vehiclePlateNumber, double lat, double lng, String status, int available
});




}
/// @nodoc
class _$DriverOfferModelCopyWithImpl<$Res>
    implements $DriverOfferModelCopyWith<$Res> {
  _$DriverOfferModelCopyWithImpl(this._self, this._then);

  final DriverOfferModel _self;
  final $Res Function(DriverOfferModel) _then;

/// Create a copy of DriverOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? driverId = null,Object? driverAddress = null,Object? driverEmail = null,Object? driverImage = freezed,Object? driverName = null,Object? driverNumber = null,Object? eta = null,Object? price = null,Object? driverRating = null,Object? quickOrderOfferId = null,Object? vehicleType = null,Object? vehicleCapacity = null,Object? vehicleSize = null,Object? vehiclePlateNumber = freezed,Object? lat = null,Object? lng = null,Object? status = null,Object? available = null,}) {
  return _then(_self.copyWith(
driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,driverAddress: null == driverAddress ? _self.driverAddress : driverAddress // ignore: cast_nullable_to_non_nullable
as String,driverEmail: null == driverEmail ? _self.driverEmail : driverEmail // ignore: cast_nullable_to_non_nullable
as String,driverImage: freezed == driverImage ? _self.driverImage : driverImage // ignore: cast_nullable_to_non_nullable
as String?,driverName: null == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String,driverNumber: null == driverNumber ? _self.driverNumber : driverNumber // ignore: cast_nullable_to_non_nullable
as String,eta: null == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,driverRating: null == driverRating ? _self.driverRating : driverRating // ignore: cast_nullable_to_non_nullable
as double,quickOrderOfferId: null == quickOrderOfferId ? _self.quickOrderOfferId : quickOrderOfferId // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,vehicleCapacity: null == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as String,vehicleSize: null == vehicleSize ? _self.vehicleSize : vehicleSize // ignore: cast_nullable_to_non_nullable
as String,vehiclePlateNumber: freezed == vehiclePlateNumber ? _self.vehiclePlateNumber : vehiclePlateNumber // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverOfferModel].
extension DriverOfferModelPatterns on DriverOfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverOfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverOfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverOfferModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverOfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverOfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverOfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "driver")  String driverId, @JsonKey(name: "driver_address")  String driverAddress, @JsonKey(name: "driver_email")  String driverEmail, @JsonKey(name: "driver_image")  String? driverImage, @JsonKey(name: "driver_name")  String driverName, @JsonKey(name: "driver_number")  String driverNumber, @JsonKey(name: "eta")  String eta, @JsonKey(name: "price")  double price, @JsonKey(name: "driver_rating")  double driverRating, @JsonKey(name: "quick_order_offer_id")  String quickOrderOfferId, @JsonKey(name: "vehicle_type")  String vehicleType, @JsonKey(name: "vehicle_capacity")  String vehicleCapacity, @JsonKey(name: "vehicle_size")  String vehicleSize, @JsonKey(name: "vehicle_plate_number")  String? vehiclePlateNumber,  double lat,  double lng,  String status,  int available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverOfferModel() when $default != null:
return $default(_that.driverId,_that.driverAddress,_that.driverEmail,_that.driverImage,_that.driverName,_that.driverNumber,_that.eta,_that.price,_that.driverRating,_that.quickOrderOfferId,_that.vehicleType,_that.vehicleCapacity,_that.vehicleSize,_that.vehiclePlateNumber,_that.lat,_that.lng,_that.status,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "driver")  String driverId, @JsonKey(name: "driver_address")  String driverAddress, @JsonKey(name: "driver_email")  String driverEmail, @JsonKey(name: "driver_image")  String? driverImage, @JsonKey(name: "driver_name")  String driverName, @JsonKey(name: "driver_number")  String driverNumber, @JsonKey(name: "eta")  String eta, @JsonKey(name: "price")  double price, @JsonKey(name: "driver_rating")  double driverRating, @JsonKey(name: "quick_order_offer_id")  String quickOrderOfferId, @JsonKey(name: "vehicle_type")  String vehicleType, @JsonKey(name: "vehicle_capacity")  String vehicleCapacity, @JsonKey(name: "vehicle_size")  String vehicleSize, @JsonKey(name: "vehicle_plate_number")  String? vehiclePlateNumber,  double lat,  double lng,  String status,  int available)  $default,) {final _that = this;
switch (_that) {
case _DriverOfferModel():
return $default(_that.driverId,_that.driverAddress,_that.driverEmail,_that.driverImage,_that.driverName,_that.driverNumber,_that.eta,_that.price,_that.driverRating,_that.quickOrderOfferId,_that.vehicleType,_that.vehicleCapacity,_that.vehicleSize,_that.vehiclePlateNumber,_that.lat,_that.lng,_that.status,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "driver")  String driverId, @JsonKey(name: "driver_address")  String driverAddress, @JsonKey(name: "driver_email")  String driverEmail, @JsonKey(name: "driver_image")  String? driverImage, @JsonKey(name: "driver_name")  String driverName, @JsonKey(name: "driver_number")  String driverNumber, @JsonKey(name: "eta")  String eta, @JsonKey(name: "price")  double price, @JsonKey(name: "driver_rating")  double driverRating, @JsonKey(name: "quick_order_offer_id")  String quickOrderOfferId, @JsonKey(name: "vehicle_type")  String vehicleType, @JsonKey(name: "vehicle_capacity")  String vehicleCapacity, @JsonKey(name: "vehicle_size")  String vehicleSize, @JsonKey(name: "vehicle_plate_number")  String? vehiclePlateNumber,  double lat,  double lng,  String status,  int available)?  $default,) {final _that = this;
switch (_that) {
case _DriverOfferModel() when $default != null:
return $default(_that.driverId,_that.driverAddress,_that.driverEmail,_that.driverImage,_that.driverName,_that.driverNumber,_that.eta,_that.price,_that.driverRating,_that.quickOrderOfferId,_that.vehicleType,_that.vehicleCapacity,_that.vehicleSize,_that.vehiclePlateNumber,_that.lat,_that.lng,_that.status,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverOfferModel implements DriverOfferModel {
  const _DriverOfferModel({@JsonKey(name: "driver") required this.driverId, @JsonKey(name: "driver_address") required this.driverAddress, @JsonKey(name: "driver_email") required this.driverEmail, @JsonKey(name: "driver_image") required this.driverImage, @JsonKey(name: "driver_name") required this.driverName, @JsonKey(name: "driver_number") required this.driverNumber, @JsonKey(name: "eta") required this.eta, @JsonKey(name: "price") required this.price, @JsonKey(name: "driver_rating") required this.driverRating, @JsonKey(name: "quick_order_offer_id") required this.quickOrderOfferId, @JsonKey(name: "vehicle_type") required this.vehicleType, @JsonKey(name: "vehicle_capacity") required this.vehicleCapacity, @JsonKey(name: "vehicle_size") required this.vehicleSize, @JsonKey(name: "vehicle_plate_number") required this.vehiclePlateNumber, required this.lat, required this.lng, required this.status, required this.available});
  factory _DriverOfferModel.fromJson(Map<String, dynamic> json) => _$DriverOfferModelFromJson(json);

@override@JsonKey(name: "driver") final  String driverId;
@override@JsonKey(name: "driver_address") final  String driverAddress;
@override@JsonKey(name: "driver_email") final  String driverEmail;
@override@JsonKey(name: "driver_image") final  String? driverImage;
@override@JsonKey(name: "driver_name") final  String driverName;
@override@JsonKey(name: "driver_number") final  String driverNumber;
@override@JsonKey(name: "eta") final  String eta;
@override@JsonKey(name: "price") final  double price;
@override@JsonKey(name: "driver_rating") final  double driverRating;
@override@JsonKey(name: "quick_order_offer_id") final  String quickOrderOfferId;
@override@JsonKey(name: "vehicle_type") final  String vehicleType;
@override@JsonKey(name: "vehicle_capacity") final  String vehicleCapacity;
@override@JsonKey(name: "vehicle_size") final  String vehicleSize;
@override@JsonKey(name: "vehicle_plate_number") final  String? vehiclePlateNumber;
@override final  double lat;
@override final  double lng;
@override final  String status;
@override final  int available;

/// Create a copy of DriverOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverOfferModelCopyWith<_DriverOfferModel> get copyWith => __$DriverOfferModelCopyWithImpl<_DriverOfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverOfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverOfferModel&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverAddress, driverAddress) || other.driverAddress == driverAddress)&&(identical(other.driverEmail, driverEmail) || other.driverEmail == driverEmail)&&(identical(other.driverImage, driverImage) || other.driverImage == driverImage)&&(identical(other.driverName, driverName) || other.driverName == driverName)&&(identical(other.driverNumber, driverNumber) || other.driverNumber == driverNumber)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.price, price) || other.price == price)&&(identical(other.driverRating, driverRating) || other.driverRating == driverRating)&&(identical(other.quickOrderOfferId, quickOrderOfferId) || other.quickOrderOfferId == quickOrderOfferId)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.vehicleSize, vehicleSize) || other.vehicleSize == vehicleSize)&&(identical(other.vehiclePlateNumber, vehiclePlateNumber) || other.vehiclePlateNumber == vehiclePlateNumber)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.status, status) || other.status == status)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,driverAddress,driverEmail,driverImage,driverName,driverNumber,eta,price,driverRating,quickOrderOfferId,vehicleType,vehicleCapacity,vehicleSize,vehiclePlateNumber,lat,lng,status,available);

@override
String toString() {
  return 'DriverOfferModel(driverId: $driverId, driverAddress: $driverAddress, driverEmail: $driverEmail, driverImage: $driverImage, driverName: $driverName, driverNumber: $driverNumber, eta: $eta, price: $price, driverRating: $driverRating, quickOrderOfferId: $quickOrderOfferId, vehicleType: $vehicleType, vehicleCapacity: $vehicleCapacity, vehicleSize: $vehicleSize, vehiclePlateNumber: $vehiclePlateNumber, lat: $lat, lng: $lng, status: $status, available: $available)';
}


}

/// @nodoc
abstract mixin class _$DriverOfferModelCopyWith<$Res> implements $DriverOfferModelCopyWith<$Res> {
  factory _$DriverOfferModelCopyWith(_DriverOfferModel value, $Res Function(_DriverOfferModel) _then) = __$DriverOfferModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "driver") String driverId,@JsonKey(name: "driver_address") String driverAddress,@JsonKey(name: "driver_email") String driverEmail,@JsonKey(name: "driver_image") String? driverImage,@JsonKey(name: "driver_name") String driverName,@JsonKey(name: "driver_number") String driverNumber,@JsonKey(name: "eta") String eta,@JsonKey(name: "price") double price,@JsonKey(name: "driver_rating") double driverRating,@JsonKey(name: "quick_order_offer_id") String quickOrderOfferId,@JsonKey(name: "vehicle_type") String vehicleType,@JsonKey(name: "vehicle_capacity") String vehicleCapacity,@JsonKey(name: "vehicle_size") String vehicleSize,@JsonKey(name: "vehicle_plate_number") String? vehiclePlateNumber, double lat, double lng, String status, int available
});




}
/// @nodoc
class __$DriverOfferModelCopyWithImpl<$Res>
    implements _$DriverOfferModelCopyWith<$Res> {
  __$DriverOfferModelCopyWithImpl(this._self, this._then);

  final _DriverOfferModel _self;
  final $Res Function(_DriverOfferModel) _then;

/// Create a copy of DriverOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? driverId = null,Object? driverAddress = null,Object? driverEmail = null,Object? driverImage = freezed,Object? driverName = null,Object? driverNumber = null,Object? eta = null,Object? price = null,Object? driverRating = null,Object? quickOrderOfferId = null,Object? vehicleType = null,Object? vehicleCapacity = null,Object? vehicleSize = null,Object? vehiclePlateNumber = freezed,Object? lat = null,Object? lng = null,Object? status = null,Object? available = null,}) {
  return _then(_DriverOfferModel(
driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,driverAddress: null == driverAddress ? _self.driverAddress : driverAddress // ignore: cast_nullable_to_non_nullable
as String,driverEmail: null == driverEmail ? _self.driverEmail : driverEmail // ignore: cast_nullable_to_non_nullable
as String,driverImage: freezed == driverImage ? _self.driverImage : driverImage // ignore: cast_nullable_to_non_nullable
as String?,driverName: null == driverName ? _self.driverName : driverName // ignore: cast_nullable_to_non_nullable
as String,driverNumber: null == driverNumber ? _self.driverNumber : driverNumber // ignore: cast_nullable_to_non_nullable
as String,eta: null == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,driverRating: null == driverRating ? _self.driverRating : driverRating // ignore: cast_nullable_to_non_nullable
as double,quickOrderOfferId: null == quickOrderOfferId ? _self.quickOrderOfferId : quickOrderOfferId // ignore: cast_nullable_to_non_nullable
as String,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String,vehicleCapacity: null == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as String,vehicleSize: null == vehicleSize ? _self.vehicleSize : vehicleSize // ignore: cast_nullable_to_non_nullable
as String,vehiclePlateNumber: freezed == vehiclePlateNumber ? _self.vehiclePlateNumber : vehiclePlateNumber // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
