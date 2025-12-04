// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderLocationModel {

 double get latitude; double get longitude; String get address;
/// Create a copy of OrderLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLocationModelCopyWith<OrderLocationModel> get copyWith => _$OrderLocationModelCopyWithImpl<OrderLocationModel>(this as OrderLocationModel, _$identity);

  /// Serializes this OrderLocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLocationModel&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address);

@override
String toString() {
  return 'OrderLocationModel(latitude: $latitude, longitude: $longitude, address: $address)';
}


}

/// @nodoc
abstract mixin class $OrderLocationModelCopyWith<$Res>  {
  factory $OrderLocationModelCopyWith(OrderLocationModel value, $Res Function(OrderLocationModel) _then) = _$OrderLocationModelCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String address
});




}
/// @nodoc
class _$OrderLocationModelCopyWithImpl<$Res>
    implements $OrderLocationModelCopyWith<$Res> {
  _$OrderLocationModelCopyWithImpl(this._self, this._then);

  final OrderLocationModel _self;
  final $Res Function(OrderLocationModel) _then;

/// Create a copy of OrderLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? address = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLocationModel].
extension OrderLocationModelPatterns on OrderLocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderLocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLocationModel() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String address)  $default,) {final _that = this;
switch (_that) {
case _OrderLocationModel():
return $default(_that.latitude,_that.longitude,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  String address)?  $default,) {final _that = this;
switch (_that) {
case _OrderLocationModel() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLocationModel implements OrderLocationModel {
  const _OrderLocationModel({required this.latitude, required this.longitude, required this.address});
  factory _OrderLocationModel.fromJson(Map<String, dynamic> json) => _$OrderLocationModelFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  String address;

/// Create a copy of OrderLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLocationModelCopyWith<_OrderLocationModel> get copyWith => __$OrderLocationModelCopyWithImpl<_OrderLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLocationModel&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address);

@override
String toString() {
  return 'OrderLocationModel(latitude: $latitude, longitude: $longitude, address: $address)';
}


}

/// @nodoc
abstract mixin class _$OrderLocationModelCopyWith<$Res> implements $OrderLocationModelCopyWith<$Res> {
  factory _$OrderLocationModelCopyWith(_OrderLocationModel value, $Res Function(_OrderLocationModel) _then) = __$OrderLocationModelCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, String address
});




}
/// @nodoc
class __$OrderLocationModelCopyWithImpl<$Res>
    implements _$OrderLocationModelCopyWith<$Res> {
  __$OrderLocationModelCopyWithImpl(this._self, this._then);

  final _OrderLocationModel _self;
  final $Res Function(_OrderLocationModel) _then;

/// Create a copy of OrderLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? address = null,}) {
  return _then(_OrderLocationModel(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
