// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyOrderDetailsModel {

@JsonKey(name: 'quick_order_id') String get quickOrderId; String get status;@JsonKey(name: 'driver_details') DriverDetails get driverDetails;@JsonKey(name: 'passenger_details') PassengerDetails get passengerDetails;@JsonKey(name: "passenger_location") OrderLocationModel get passengerLocation;@JsonKey(name: "destination_location") OrderLocationModel get destinationLocation;@JsonKey(name: "map_image") String? get mapImage;@JsonKey(name: "service_type") String get serviceType;@JsonKey(name: "payment_method") String? get paymentMethod;@JsonKey(name: "coupon_code") String? get couponCode;@JsonKey(name: "fare_details") FareDetails get fareDetails;@JsonKey(name: "creation_date") DateTime get creationDate;@JsonKey(name: "creation_time") String get creationTime;@JsonKey(name: "start_time") String get startTime;@JsonKey(name: "end_time") String get endTime;
/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOrderDetailsModelCopyWith<MyOrderDetailsModel> get copyWith => _$MyOrderDetailsModelCopyWithImpl<MyOrderDetailsModel>(this as MyOrderDetailsModel, _$identity);

  /// Serializes this MyOrderDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOrderDetailsModel&&(identical(other.quickOrderId, quickOrderId) || other.quickOrderId == quickOrderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.driverDetails, driverDetails) || other.driverDetails == driverDetails)&&(identical(other.passengerDetails, passengerDetails) || other.passengerDetails == passengerDetails)&&(identical(other.passengerLocation, passengerLocation) || other.passengerLocation == passengerLocation)&&(identical(other.destinationLocation, destinationLocation) || other.destinationLocation == destinationLocation)&&(identical(other.mapImage, mapImage) || other.mapImage == mapImage)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.fareDetails, fareDetails) || other.fareDetails == fareDetails)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderId,status,driverDetails,passengerDetails,passengerLocation,destinationLocation,mapImage,serviceType,paymentMethod,couponCode,fareDetails,creationDate,creationTime,startTime,endTime);

@override
String toString() {
  return 'MyOrderDetailsModel(quickOrderId: $quickOrderId, status: $status, driverDetails: $driverDetails, passengerDetails: $passengerDetails, passengerLocation: $passengerLocation, destinationLocation: $destinationLocation, mapImage: $mapImage, serviceType: $serviceType, paymentMethod: $paymentMethod, couponCode: $couponCode, fareDetails: $fareDetails, creationDate: $creationDate, creationTime: $creationTime, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $MyOrderDetailsModelCopyWith<$Res>  {
  factory $MyOrderDetailsModelCopyWith(MyOrderDetailsModel value, $Res Function(MyOrderDetailsModel) _then) = _$MyOrderDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'quick_order_id') String quickOrderId, String status,@JsonKey(name: 'driver_details') DriverDetails driverDetails,@JsonKey(name: 'passenger_details') PassengerDetails passengerDetails,@JsonKey(name: "passenger_location") OrderLocationModel passengerLocation,@JsonKey(name: "destination_location") OrderLocationModel destinationLocation,@JsonKey(name: "map_image") String? mapImage,@JsonKey(name: "service_type") String serviceType,@JsonKey(name: "payment_method") String? paymentMethod,@JsonKey(name: "coupon_code") String? couponCode,@JsonKey(name: "fare_details") FareDetails fareDetails,@JsonKey(name: "creation_date") DateTime creationDate,@JsonKey(name: "creation_time") String creationTime,@JsonKey(name: "start_time") String startTime,@JsonKey(name: "end_time") String endTime
});


$DriverDetailsCopyWith<$Res> get driverDetails;$PassengerDetailsCopyWith<$Res> get passengerDetails;$OrderLocationModelCopyWith<$Res> get passengerLocation;$OrderLocationModelCopyWith<$Res> get destinationLocation;$FareDetailsCopyWith<$Res> get fareDetails;

}
/// @nodoc
class _$MyOrderDetailsModelCopyWithImpl<$Res>
    implements $MyOrderDetailsModelCopyWith<$Res> {
  _$MyOrderDetailsModelCopyWithImpl(this._self, this._then);

  final MyOrderDetailsModel _self;
  final $Res Function(MyOrderDetailsModel) _then;

/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quickOrderId = null,Object? status = null,Object? driverDetails = null,Object? passengerDetails = null,Object? passengerLocation = null,Object? destinationLocation = null,Object? mapImage = freezed,Object? serviceType = null,Object? paymentMethod = freezed,Object? couponCode = freezed,Object? fareDetails = null,Object? creationDate = null,Object? creationTime = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
quickOrderId: null == quickOrderId ? _self.quickOrderId : quickOrderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,driverDetails: null == driverDetails ? _self.driverDetails : driverDetails // ignore: cast_nullable_to_non_nullable
as DriverDetails,passengerDetails: null == passengerDetails ? _self.passengerDetails : passengerDetails // ignore: cast_nullable_to_non_nullable
as PassengerDetails,passengerLocation: null == passengerLocation ? _self.passengerLocation : passengerLocation // ignore: cast_nullable_to_non_nullable
as OrderLocationModel,destinationLocation: null == destinationLocation ? _self.destinationLocation : destinationLocation // ignore: cast_nullable_to_non_nullable
as OrderLocationModel,mapImage: freezed == mapImage ? _self.mapImage : mapImage // ignore: cast_nullable_to_non_nullable
as String?,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,fareDetails: null == fareDetails ? _self.fareDetails : fareDetails // ignore: cast_nullable_to_non_nullable
as FareDetails,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverDetailsCopyWith<$Res> get driverDetails {
  
  return $DriverDetailsCopyWith<$Res>(_self.driverDetails, (value) {
    return _then(_self.copyWith(driverDetails: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerDetailsCopyWith<$Res> get passengerDetails {
  
  return $PassengerDetailsCopyWith<$Res>(_self.passengerDetails, (value) {
    return _then(_self.copyWith(passengerDetails: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLocationModelCopyWith<$Res> get passengerLocation {
  
  return $OrderLocationModelCopyWith<$Res>(_self.passengerLocation, (value) {
    return _then(_self.copyWith(passengerLocation: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLocationModelCopyWith<$Res> get destinationLocation {
  
  return $OrderLocationModelCopyWith<$Res>(_self.destinationLocation, (value) {
    return _then(_self.copyWith(destinationLocation: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FareDetailsCopyWith<$Res> get fareDetails {
  
  return $FareDetailsCopyWith<$Res>(_self.fareDetails, (value) {
    return _then(_self.copyWith(fareDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyOrderDetailsModel].
extension MyOrderDetailsModelPatterns on MyOrderDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyOrderDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyOrderDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyOrderDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _MyOrderDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyOrderDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyOrderDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_order_id')  String quickOrderId,  String status, @JsonKey(name: 'driver_details')  DriverDetails driverDetails, @JsonKey(name: 'passenger_details')  PassengerDetails passengerDetails, @JsonKey(name: "passenger_location")  OrderLocationModel passengerLocation, @JsonKey(name: "destination_location")  OrderLocationModel destinationLocation, @JsonKey(name: "map_image")  String? mapImage, @JsonKey(name: "service_type")  String serviceType, @JsonKey(name: "payment_method")  String? paymentMethod, @JsonKey(name: "coupon_code")  String? couponCode, @JsonKey(name: "fare_details")  FareDetails fareDetails, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "creation_time")  String creationTime, @JsonKey(name: "start_time")  String startTime, @JsonKey(name: "end_time")  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyOrderDetailsModel() when $default != null:
return $default(_that.quickOrderId,_that.status,_that.driverDetails,_that.passengerDetails,_that.passengerLocation,_that.destinationLocation,_that.mapImage,_that.serviceType,_that.paymentMethod,_that.couponCode,_that.fareDetails,_that.creationDate,_that.creationTime,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'quick_order_id')  String quickOrderId,  String status, @JsonKey(name: 'driver_details')  DriverDetails driverDetails, @JsonKey(name: 'passenger_details')  PassengerDetails passengerDetails, @JsonKey(name: "passenger_location")  OrderLocationModel passengerLocation, @JsonKey(name: "destination_location")  OrderLocationModel destinationLocation, @JsonKey(name: "map_image")  String? mapImage, @JsonKey(name: "service_type")  String serviceType, @JsonKey(name: "payment_method")  String? paymentMethod, @JsonKey(name: "coupon_code")  String? couponCode, @JsonKey(name: "fare_details")  FareDetails fareDetails, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "creation_time")  String creationTime, @JsonKey(name: "start_time")  String startTime, @JsonKey(name: "end_time")  String endTime)  $default,) {final _that = this;
switch (_that) {
case _MyOrderDetailsModel():
return $default(_that.quickOrderId,_that.status,_that.driverDetails,_that.passengerDetails,_that.passengerLocation,_that.destinationLocation,_that.mapImage,_that.serviceType,_that.paymentMethod,_that.couponCode,_that.fareDetails,_that.creationDate,_that.creationTime,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'quick_order_id')  String quickOrderId,  String status, @JsonKey(name: 'driver_details')  DriverDetails driverDetails, @JsonKey(name: 'passenger_details')  PassengerDetails passengerDetails, @JsonKey(name: "passenger_location")  OrderLocationModel passengerLocation, @JsonKey(name: "destination_location")  OrderLocationModel destinationLocation, @JsonKey(name: "map_image")  String? mapImage, @JsonKey(name: "service_type")  String serviceType, @JsonKey(name: "payment_method")  String? paymentMethod, @JsonKey(name: "coupon_code")  String? couponCode, @JsonKey(name: "fare_details")  FareDetails fareDetails, @JsonKey(name: "creation_date")  DateTime creationDate, @JsonKey(name: "creation_time")  String creationTime, @JsonKey(name: "start_time")  String startTime, @JsonKey(name: "end_time")  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _MyOrderDetailsModel() when $default != null:
return $default(_that.quickOrderId,_that.status,_that.driverDetails,_that.passengerDetails,_that.passengerLocation,_that.destinationLocation,_that.mapImage,_that.serviceType,_that.paymentMethod,_that.couponCode,_that.fareDetails,_that.creationDate,_that.creationTime,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyOrderDetailsModel implements MyOrderDetailsModel {
  const _MyOrderDetailsModel({@JsonKey(name: 'quick_order_id') required this.quickOrderId, required this.status, @JsonKey(name: 'driver_details') required this.driverDetails, @JsonKey(name: 'passenger_details') required this.passengerDetails, @JsonKey(name: "passenger_location") required this.passengerLocation, @JsonKey(name: "destination_location") required this.destinationLocation, @JsonKey(name: "map_image") this.mapImage, @JsonKey(name: "service_type") required this.serviceType, @JsonKey(name: "payment_method") required this.paymentMethod, @JsonKey(name: "coupon_code") this.couponCode, @JsonKey(name: "fare_details") required this.fareDetails, @JsonKey(name: "creation_date") required this.creationDate, @JsonKey(name: "creation_time") required this.creationTime, @JsonKey(name: "start_time") required this.startTime, @JsonKey(name: "end_time") required this.endTime});
  factory _MyOrderDetailsModel.fromJson(Map<String, dynamic> json) => _$MyOrderDetailsModelFromJson(json);

@override@JsonKey(name: 'quick_order_id') final  String quickOrderId;
@override final  String status;
@override@JsonKey(name: 'driver_details') final  DriverDetails driverDetails;
@override@JsonKey(name: 'passenger_details') final  PassengerDetails passengerDetails;
@override@JsonKey(name: "passenger_location") final  OrderLocationModel passengerLocation;
@override@JsonKey(name: "destination_location") final  OrderLocationModel destinationLocation;
@override@JsonKey(name: "map_image") final  String? mapImage;
@override@JsonKey(name: "service_type") final  String serviceType;
@override@JsonKey(name: "payment_method") final  String? paymentMethod;
@override@JsonKey(name: "coupon_code") final  String? couponCode;
@override@JsonKey(name: "fare_details") final  FareDetails fareDetails;
@override@JsonKey(name: "creation_date") final  DateTime creationDate;
@override@JsonKey(name: "creation_time") final  String creationTime;
@override@JsonKey(name: "start_time") final  String startTime;
@override@JsonKey(name: "end_time") final  String endTime;

/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOrderDetailsModelCopyWith<_MyOrderDetailsModel> get copyWith => __$MyOrderDetailsModelCopyWithImpl<_MyOrderDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyOrderDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOrderDetailsModel&&(identical(other.quickOrderId, quickOrderId) || other.quickOrderId == quickOrderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.driverDetails, driverDetails) || other.driverDetails == driverDetails)&&(identical(other.passengerDetails, passengerDetails) || other.passengerDetails == passengerDetails)&&(identical(other.passengerLocation, passengerLocation) || other.passengerLocation == passengerLocation)&&(identical(other.destinationLocation, destinationLocation) || other.destinationLocation == destinationLocation)&&(identical(other.mapImage, mapImage) || other.mapImage == mapImage)&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.fareDetails, fareDetails) || other.fareDetails == fareDetails)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderId,status,driverDetails,passengerDetails,passengerLocation,destinationLocation,mapImage,serviceType,paymentMethod,couponCode,fareDetails,creationDate,creationTime,startTime,endTime);

@override
String toString() {
  return 'MyOrderDetailsModel(quickOrderId: $quickOrderId, status: $status, driverDetails: $driverDetails, passengerDetails: $passengerDetails, passengerLocation: $passengerLocation, destinationLocation: $destinationLocation, mapImage: $mapImage, serviceType: $serviceType, paymentMethod: $paymentMethod, couponCode: $couponCode, fareDetails: $fareDetails, creationDate: $creationDate, creationTime: $creationTime, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$MyOrderDetailsModelCopyWith<$Res> implements $MyOrderDetailsModelCopyWith<$Res> {
  factory _$MyOrderDetailsModelCopyWith(_MyOrderDetailsModel value, $Res Function(_MyOrderDetailsModel) _then) = __$MyOrderDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'quick_order_id') String quickOrderId, String status,@JsonKey(name: 'driver_details') DriverDetails driverDetails,@JsonKey(name: 'passenger_details') PassengerDetails passengerDetails,@JsonKey(name: "passenger_location") OrderLocationModel passengerLocation,@JsonKey(name: "destination_location") OrderLocationModel destinationLocation,@JsonKey(name: "map_image") String? mapImage,@JsonKey(name: "service_type") String serviceType,@JsonKey(name: "payment_method") String? paymentMethod,@JsonKey(name: "coupon_code") String? couponCode,@JsonKey(name: "fare_details") FareDetails fareDetails,@JsonKey(name: "creation_date") DateTime creationDate,@JsonKey(name: "creation_time") String creationTime,@JsonKey(name: "start_time") String startTime,@JsonKey(name: "end_time") String endTime
});


@override $DriverDetailsCopyWith<$Res> get driverDetails;@override $PassengerDetailsCopyWith<$Res> get passengerDetails;@override $OrderLocationModelCopyWith<$Res> get passengerLocation;@override $OrderLocationModelCopyWith<$Res> get destinationLocation;@override $FareDetailsCopyWith<$Res> get fareDetails;

}
/// @nodoc
class __$MyOrderDetailsModelCopyWithImpl<$Res>
    implements _$MyOrderDetailsModelCopyWith<$Res> {
  __$MyOrderDetailsModelCopyWithImpl(this._self, this._then);

  final _MyOrderDetailsModel _self;
  final $Res Function(_MyOrderDetailsModel) _then;

/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quickOrderId = null,Object? status = null,Object? driverDetails = null,Object? passengerDetails = null,Object? passengerLocation = null,Object? destinationLocation = null,Object? mapImage = freezed,Object? serviceType = null,Object? paymentMethod = freezed,Object? couponCode = freezed,Object? fareDetails = null,Object? creationDate = null,Object? creationTime = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_MyOrderDetailsModel(
quickOrderId: null == quickOrderId ? _self.quickOrderId : quickOrderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,driverDetails: null == driverDetails ? _self.driverDetails : driverDetails // ignore: cast_nullable_to_non_nullable
as DriverDetails,passengerDetails: null == passengerDetails ? _self.passengerDetails : passengerDetails // ignore: cast_nullable_to_non_nullable
as PassengerDetails,passengerLocation: null == passengerLocation ? _self.passengerLocation : passengerLocation // ignore: cast_nullable_to_non_nullable
as OrderLocationModel,destinationLocation: null == destinationLocation ? _self.destinationLocation : destinationLocation // ignore: cast_nullable_to_non_nullable
as OrderLocationModel,mapImage: freezed == mapImage ? _self.mapImage : mapImage // ignore: cast_nullable_to_non_nullable
as String?,serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,fareDetails: null == fareDetails ? _self.fareDetails : fareDetails // ignore: cast_nullable_to_non_nullable
as FareDetails,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverDetailsCopyWith<$Res> get driverDetails {
  
  return $DriverDetailsCopyWith<$Res>(_self.driverDetails, (value) {
    return _then(_self.copyWith(driverDetails: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PassengerDetailsCopyWith<$Res> get passengerDetails {
  
  return $PassengerDetailsCopyWith<$Res>(_self.passengerDetails, (value) {
    return _then(_self.copyWith(passengerDetails: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLocationModelCopyWith<$Res> get passengerLocation {
  
  return $OrderLocationModelCopyWith<$Res>(_self.passengerLocation, (value) {
    return _then(_self.copyWith(passengerLocation: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderLocationModelCopyWith<$Res> get destinationLocation {
  
  return $OrderLocationModelCopyWith<$Res>(_self.destinationLocation, (value) {
    return _then(_self.copyWith(destinationLocation: value));
  });
}/// Create a copy of MyOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FareDetailsCopyWith<$Res> get fareDetails {
  
  return $FareDetailsCopyWith<$Res>(_self.fareDetails, (value) {
    return _then(_self.copyWith(fareDetails: value));
  });
}
}

// dart format on
