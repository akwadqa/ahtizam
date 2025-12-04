// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_quick_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverQuickOrderModel {

@JsonKey(name: "driver_id") String? get driverId;@JsonKey(name: "driver_email") String? get driverEmail;@JsonKey(name: "driver_address") String? get driverAddress; String get status; int get available;@JsonKey(name: "driver_name") String get name;@JsonKey(name: "driver_image") String? get image;@JsonKey(name: "driver_number") String get phone;@JsonKey(name: "vehicle_type") String? get vehicleType;@JsonKey(name: "vehicle_plate_number") String? get vehiclePlateNumber;//   @JsonKey(name: "otp_number")  required String otpNumber,
@JsonKey(name: "driver_rating") double get rate; double? get lat; double? get lng;
/// Create a copy of DriverQuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverQuickOrderModelCopyWith<DriverQuickOrderModel> get copyWith => _$DriverQuickOrderModelCopyWithImpl<DriverQuickOrderModel>(this as DriverQuickOrderModel, _$identity);

  /// Serializes this DriverQuickOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverQuickOrderModel&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverEmail, driverEmail) || other.driverEmail == driverEmail)&&(identical(other.driverAddress, driverAddress) || other.driverAddress == driverAddress)&&(identical(other.status, status) || other.status == status)&&(identical(other.available, available) || other.available == available)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehiclePlateNumber, vehiclePlateNumber) || other.vehiclePlateNumber == vehiclePlateNumber)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,driverEmail,driverAddress,status,available,name,image,phone,vehicleType,vehiclePlateNumber,rate,lat,lng);

@override
String toString() {
  return 'DriverQuickOrderModel(driverId: $driverId, driverEmail: $driverEmail, driverAddress: $driverAddress, status: $status, available: $available, name: $name, image: $image, phone: $phone, vehicleType: $vehicleType, vehiclePlateNumber: $vehiclePlateNumber, rate: $rate, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $DriverQuickOrderModelCopyWith<$Res>  {
  factory $DriverQuickOrderModelCopyWith(DriverQuickOrderModel value, $Res Function(DriverQuickOrderModel) _then) = _$DriverQuickOrderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "driver_id") String? driverId,@JsonKey(name: "driver_email") String? driverEmail,@JsonKey(name: "driver_address") String? driverAddress, String status, int available,@JsonKey(name: "driver_name") String name,@JsonKey(name: "driver_image") String? image,@JsonKey(name: "driver_number") String phone,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "vehicle_plate_number") String? vehiclePlateNumber,@JsonKey(name: "driver_rating") double rate, double? lat, double? lng
});




}
/// @nodoc
class _$DriverQuickOrderModelCopyWithImpl<$Res>
    implements $DriverQuickOrderModelCopyWith<$Res> {
  _$DriverQuickOrderModelCopyWithImpl(this._self, this._then);

  final DriverQuickOrderModel _self;
  final $Res Function(DriverQuickOrderModel) _then;

/// Create a copy of DriverQuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? driverId = freezed,Object? driverEmail = freezed,Object? driverAddress = freezed,Object? status = null,Object? available = null,Object? name = null,Object? image = freezed,Object? phone = null,Object? vehicleType = freezed,Object? vehiclePlateNumber = freezed,Object? rate = null,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,driverEmail: freezed == driverEmail ? _self.driverEmail : driverEmail // ignore: cast_nullable_to_non_nullable
as String?,driverAddress: freezed == driverAddress ? _self.driverAddress : driverAddress // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,vehiclePlateNumber: freezed == vehiclePlateNumber ? _self.vehiclePlateNumber : vehiclePlateNumber // ignore: cast_nullable_to_non_nullable
as String?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverQuickOrderModel].
extension DriverQuickOrderModelPatterns on DriverQuickOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverQuickOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverQuickOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverQuickOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverQuickOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverQuickOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverQuickOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "driver_id")  String? driverId, @JsonKey(name: "driver_email")  String? driverEmail, @JsonKey(name: "driver_address")  String? driverAddress,  String status,  int available, @JsonKey(name: "driver_name")  String name, @JsonKey(name: "driver_image")  String? image, @JsonKey(name: "driver_number")  String phone, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "vehicle_plate_number")  String? vehiclePlateNumber, @JsonKey(name: "driver_rating")  double rate,  double? lat,  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverQuickOrderModel() when $default != null:
return $default(_that.driverId,_that.driverEmail,_that.driverAddress,_that.status,_that.available,_that.name,_that.image,_that.phone,_that.vehicleType,_that.vehiclePlateNumber,_that.rate,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "driver_id")  String? driverId, @JsonKey(name: "driver_email")  String? driverEmail, @JsonKey(name: "driver_address")  String? driverAddress,  String status,  int available, @JsonKey(name: "driver_name")  String name, @JsonKey(name: "driver_image")  String? image, @JsonKey(name: "driver_number")  String phone, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "vehicle_plate_number")  String? vehiclePlateNumber, @JsonKey(name: "driver_rating")  double rate,  double? lat,  double? lng)  $default,) {final _that = this;
switch (_that) {
case _DriverQuickOrderModel():
return $default(_that.driverId,_that.driverEmail,_that.driverAddress,_that.status,_that.available,_that.name,_that.image,_that.phone,_that.vehicleType,_that.vehiclePlateNumber,_that.rate,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "driver_id")  String? driverId, @JsonKey(name: "driver_email")  String? driverEmail, @JsonKey(name: "driver_address")  String? driverAddress,  String status,  int available, @JsonKey(name: "driver_name")  String name, @JsonKey(name: "driver_image")  String? image, @JsonKey(name: "driver_number")  String phone, @JsonKey(name: "vehicle_type")  String? vehicleType, @JsonKey(name: "vehicle_plate_number")  String? vehiclePlateNumber, @JsonKey(name: "driver_rating")  double rate,  double? lat,  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _DriverQuickOrderModel() when $default != null:
return $default(_that.driverId,_that.driverEmail,_that.driverAddress,_that.status,_that.available,_that.name,_that.image,_that.phone,_that.vehicleType,_that.vehiclePlateNumber,_that.rate,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverQuickOrderModel implements DriverQuickOrderModel {
   _DriverQuickOrderModel({@JsonKey(name: "driver_id") required this.driverId, @JsonKey(name: "driver_email") required this.driverEmail, @JsonKey(name: "driver_address") required this.driverAddress, required this.status, required this.available, @JsonKey(name: "driver_name") required this.name, @JsonKey(name: "driver_image") this.image, @JsonKey(name: "driver_number") required this.phone, @JsonKey(name: "vehicle_type") required this.vehicleType, @JsonKey(name: "vehicle_plate_number") required this.vehiclePlateNumber, @JsonKey(name: "driver_rating") required this.rate, required this.lat, required this.lng});
  factory _DriverQuickOrderModel.fromJson(Map<String, dynamic> json) => _$DriverQuickOrderModelFromJson(json);

@override@JsonKey(name: "driver_id") final  String? driverId;
@override@JsonKey(name: "driver_email") final  String? driverEmail;
@override@JsonKey(name: "driver_address") final  String? driverAddress;
@override final  String status;
@override final  int available;
@override@JsonKey(name: "driver_name") final  String name;
@override@JsonKey(name: "driver_image") final  String? image;
@override@JsonKey(name: "driver_number") final  String phone;
@override@JsonKey(name: "vehicle_type") final  String? vehicleType;
@override@JsonKey(name: "vehicle_plate_number") final  String? vehiclePlateNumber;
//   @JsonKey(name: "otp_number")  required String otpNumber,
@override@JsonKey(name: "driver_rating") final  double rate;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of DriverQuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverQuickOrderModelCopyWith<_DriverQuickOrderModel> get copyWith => __$DriverQuickOrderModelCopyWithImpl<_DriverQuickOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverQuickOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverQuickOrderModel&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.driverEmail, driverEmail) || other.driverEmail == driverEmail)&&(identical(other.driverAddress, driverAddress) || other.driverAddress == driverAddress)&&(identical(other.status, status) || other.status == status)&&(identical(other.available, available) || other.available == available)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.vehiclePlateNumber, vehiclePlateNumber) || other.vehiclePlateNumber == vehiclePlateNumber)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,driverEmail,driverAddress,status,available,name,image,phone,vehicleType,vehiclePlateNumber,rate,lat,lng);

@override
String toString() {
  return 'DriverQuickOrderModel(driverId: $driverId, driverEmail: $driverEmail, driverAddress: $driverAddress, status: $status, available: $available, name: $name, image: $image, phone: $phone, vehicleType: $vehicleType, vehiclePlateNumber: $vehiclePlateNumber, rate: $rate, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$DriverQuickOrderModelCopyWith<$Res> implements $DriverQuickOrderModelCopyWith<$Res> {
  factory _$DriverQuickOrderModelCopyWith(_DriverQuickOrderModel value, $Res Function(_DriverQuickOrderModel) _then) = __$DriverQuickOrderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "driver_id") String? driverId,@JsonKey(name: "driver_email") String? driverEmail,@JsonKey(name: "driver_address") String? driverAddress, String status, int available,@JsonKey(name: "driver_name") String name,@JsonKey(name: "driver_image") String? image,@JsonKey(name: "driver_number") String phone,@JsonKey(name: "vehicle_type") String? vehicleType,@JsonKey(name: "vehicle_plate_number") String? vehiclePlateNumber,@JsonKey(name: "driver_rating") double rate, double? lat, double? lng
});




}
/// @nodoc
class __$DriverQuickOrderModelCopyWithImpl<$Res>
    implements _$DriverQuickOrderModelCopyWith<$Res> {
  __$DriverQuickOrderModelCopyWithImpl(this._self, this._then);

  final _DriverQuickOrderModel _self;
  final $Res Function(_DriverQuickOrderModel) _then;

/// Create a copy of DriverQuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? driverId = freezed,Object? driverEmail = freezed,Object? driverAddress = freezed,Object? status = null,Object? available = null,Object? name = null,Object? image = freezed,Object? phone = null,Object? vehicleType = freezed,Object? vehiclePlateNumber = freezed,Object? rate = null,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_DriverQuickOrderModel(
driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,driverEmail: freezed == driverEmail ? _self.driverEmail : driverEmail // ignore: cast_nullable_to_non_nullable
as String?,driverAddress: freezed == driverAddress ? _self.driverAddress : driverAddress // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,vehiclePlateNumber: freezed == vehiclePlateNumber ? _self.vehiclePlateNumber : vehiclePlateNumber // ignore: cast_nullable_to_non_nullable
as String?,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
