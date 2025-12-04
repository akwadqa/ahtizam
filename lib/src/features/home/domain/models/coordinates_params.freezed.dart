// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinates_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoordinatesParams {

 double get lat; double get lng; String get address;
/// Create a copy of CoordinatesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordinatesParamsCopyWith<CoordinatesParams> get copyWith => _$CoordinatesParamsCopyWithImpl<CoordinatesParams>(this as CoordinatesParams, _$identity);

  /// Serializes this CoordinatesParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoordinatesParams&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address);

@override
String toString() {
  return 'CoordinatesParams(lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class $CoordinatesParamsCopyWith<$Res>  {
  factory $CoordinatesParamsCopyWith(CoordinatesParams value, $Res Function(CoordinatesParams) _then) = _$CoordinatesParamsCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, String address
});




}
/// @nodoc
class _$CoordinatesParamsCopyWithImpl<$Res>
    implements $CoordinatesParamsCopyWith<$Res> {
  _$CoordinatesParamsCopyWithImpl(this._self, this._then);

  final CoordinatesParams _self;
  final $Res Function(CoordinatesParams) _then;

/// Create a copy of CoordinatesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,Object? address = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoordinatesParams].
extension CoordinatesParamsPatterns on CoordinatesParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoordinatesParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoordinatesParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoordinatesParams value)  $default,){
final _that = this;
switch (_that) {
case _CoordinatesParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoordinatesParams value)?  $default,){
final _that = this;
switch (_that) {
case _CoordinatesParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoordinatesParams() when $default != null:
return $default(_that.lat,_that.lng,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng,  String address)  $default,) {final _that = this;
switch (_that) {
case _CoordinatesParams():
return $default(_that.lat,_that.lng,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng,  String address)?  $default,) {final _that = this;
switch (_that) {
case _CoordinatesParams() when $default != null:
return $default(_that.lat,_that.lng,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoordinatesParams implements CoordinatesParams {
  const _CoordinatesParams({required this.lat, required this.lng, required this.address});
  factory _CoordinatesParams.fromJson(Map<String, dynamic> json) => _$CoordinatesParamsFromJson(json);

@override final  double lat;
@override final  double lng;
@override final  String address;

/// Create a copy of CoordinatesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordinatesParamsCopyWith<_CoordinatesParams> get copyWith => __$CoordinatesParamsCopyWithImpl<_CoordinatesParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordinatesParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoordinatesParams&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address);

@override
String toString() {
  return 'CoordinatesParams(lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class _$CoordinatesParamsCopyWith<$Res> implements $CoordinatesParamsCopyWith<$Res> {
  factory _$CoordinatesParamsCopyWith(_CoordinatesParams value, $Res Function(_CoordinatesParams) _then) = __$CoordinatesParamsCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng, String address
});




}
/// @nodoc
class __$CoordinatesParamsCopyWithImpl<$Res>
    implements _$CoordinatesParamsCopyWith<$Res> {
  __$CoordinatesParamsCopyWithImpl(this._self, this._then);

  final _CoordinatesParams _self;
  final $Res Function(_CoordinatesParams) _then;

/// Create a copy of CoordinatesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? address = null,}) {
  return _then(_CoordinatesParams(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
