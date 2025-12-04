// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverDetails {

// @JsonKey(name: "assigned_date") required DateTime assignedDate,
// @JsonKey(name: "assigned_time") required String assignedTime,
@JsonKey(name: "assigned_driver") String? get assignedDriver;@JsonKey(name: "full_name") String? get fullName;@JsonKey(name: "phone") String? get driverPhone;@JsonKey(name: "profile_image") String? get profileImage;@JsonKey(name: "driver_rating") double? get rating;
/// Create a copy of DriverDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverDetailsCopyWith<DriverDetails> get copyWith => _$DriverDetailsCopyWithImpl<DriverDetails>(this as DriverDetails, _$identity);

  /// Serializes this DriverDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverDetails&&(identical(other.assignedDriver, assignedDriver) || other.assignedDriver == assignedDriver)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignedDriver,fullName,driverPhone,profileImage,rating);

@override
String toString() {
  return 'DriverDetails(assignedDriver: $assignedDriver, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $DriverDetailsCopyWith<$Res>  {
  factory $DriverDetailsCopyWith(DriverDetails value, $Res Function(DriverDetails) _then) = _$DriverDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "assigned_driver") String? assignedDriver,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "phone") String? driverPhone,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "driver_rating") double? rating
});




}
/// @nodoc
class _$DriverDetailsCopyWithImpl<$Res>
    implements $DriverDetailsCopyWith<$Res> {
  _$DriverDetailsCopyWithImpl(this._self, this._then);

  final DriverDetails _self;
  final $Res Function(DriverDetails) _then;

/// Create a copy of DriverDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignedDriver = freezed,Object? fullName = freezed,Object? driverPhone = freezed,Object? profileImage = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
assignedDriver: freezed == assignedDriver ? _self.assignedDriver : assignedDriver // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverDetails].
extension DriverDetailsPatterns on DriverDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverDetails value)  $default,){
final _that = this;
switch (_that) {
case _DriverDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverDetails value)?  $default,){
final _that = this;
switch (_that) {
case _DriverDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "assigned_driver")  String? assignedDriver, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "phone")  String? driverPhone, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "driver_rating")  double? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverDetails() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "assigned_driver")  String? assignedDriver, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "phone")  String? driverPhone, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "driver_rating")  double? rating)  $default,) {final _that = this;
switch (_that) {
case _DriverDetails():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "assigned_driver")  String? assignedDriver, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "phone")  String? driverPhone, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "driver_rating")  double? rating)?  $default,) {final _that = this;
switch (_that) {
case _DriverDetails() when $default != null:
return $default(_that.assignedDriver,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverDetails implements DriverDetails {
  const _DriverDetails({@JsonKey(name: "assigned_driver") required this.assignedDriver, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "phone") required this.driverPhone, @JsonKey(name: "profile_image") this.profileImage, @JsonKey(name: "driver_rating") required this.rating});
  factory _DriverDetails.fromJson(Map<String, dynamic> json) => _$DriverDetailsFromJson(json);

// @JsonKey(name: "assigned_date") required DateTime assignedDate,
// @JsonKey(name: "assigned_time") required String assignedTime,
@override@JsonKey(name: "assigned_driver") final  String? assignedDriver;
@override@JsonKey(name: "full_name") final  String? fullName;
@override@JsonKey(name: "phone") final  String? driverPhone;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override@JsonKey(name: "driver_rating") final  double? rating;

/// Create a copy of DriverDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverDetailsCopyWith<_DriverDetails> get copyWith => __$DriverDetailsCopyWithImpl<_DriverDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverDetails&&(identical(other.assignedDriver, assignedDriver) || other.assignedDriver == assignedDriver)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignedDriver,fullName,driverPhone,profileImage,rating);

@override
String toString() {
  return 'DriverDetails(assignedDriver: $assignedDriver, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$DriverDetailsCopyWith<$Res> implements $DriverDetailsCopyWith<$Res> {
  factory _$DriverDetailsCopyWith(_DriverDetails value, $Res Function(_DriverDetails) _then) = __$DriverDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "assigned_driver") String? assignedDriver,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "phone") String? driverPhone,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "driver_rating") double? rating
});




}
/// @nodoc
class __$DriverDetailsCopyWithImpl<$Res>
    implements _$DriverDetailsCopyWith<$Res> {
  __$DriverDetailsCopyWithImpl(this._self, this._then);

  final _DriverDetails _self;
  final $Res Function(_DriverDetails) _then;

/// Create a copy of DriverDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignedDriver = freezed,Object? fullName = freezed,Object? driverPhone = freezed,Object? profileImage = freezed,Object? rating = freezed,}) {
  return _then(_DriverDetails(
assignedDriver: freezed == assignedDriver ? _self.assignedDriver : assignedDriver // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
