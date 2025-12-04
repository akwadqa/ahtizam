// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PassengerDetails {

 String get passenger;@JsonKey(name: "full_name") String? get fullName;@JsonKey(name: "phone") String? get driverPhone;@JsonKey(name: "profile_image") String? get profileImage;
/// Create a copy of PassengerDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassengerDetailsCopyWith<PassengerDetails> get copyWith => _$PassengerDetailsCopyWithImpl<PassengerDetails>(this as PassengerDetails, _$identity);

  /// Serializes this PassengerDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PassengerDetails&&(identical(other.passenger, passenger) || other.passenger == passenger)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passenger,fullName,driverPhone,profileImage);

@override
String toString() {
  return 'PassengerDetails(passenger: $passenger, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class $PassengerDetailsCopyWith<$Res>  {
  factory $PassengerDetailsCopyWith(PassengerDetails value, $Res Function(PassengerDetails) _then) = _$PassengerDetailsCopyWithImpl;
@useResult
$Res call({
 String passenger,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "phone") String? driverPhone,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class _$PassengerDetailsCopyWithImpl<$Res>
    implements $PassengerDetailsCopyWith<$Res> {
  _$PassengerDetailsCopyWithImpl(this._self, this._then);

  final PassengerDetails _self;
  final $Res Function(PassengerDetails) _then;

/// Create a copy of PassengerDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passenger = null,Object? fullName = freezed,Object? driverPhone = freezed,Object? profileImage = freezed,}) {
  return _then(_self.copyWith(
passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PassengerDetails].
extension PassengerDetailsPatterns on PassengerDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PassengerDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PassengerDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PassengerDetails value)  $default,){
final _that = this;
switch (_that) {
case _PassengerDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PassengerDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PassengerDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String passenger, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "phone")  String? driverPhone, @JsonKey(name: "profile_image")  String? profileImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PassengerDetails() when $default != null:
return $default(_that.passenger,_that.fullName,_that.driverPhone,_that.profileImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String passenger, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "phone")  String? driverPhone, @JsonKey(name: "profile_image")  String? profileImage)  $default,) {final _that = this;
switch (_that) {
case _PassengerDetails():
return $default(_that.passenger,_that.fullName,_that.driverPhone,_that.profileImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String passenger, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "phone")  String? driverPhone, @JsonKey(name: "profile_image")  String? profileImage)?  $default,) {final _that = this;
switch (_that) {
case _PassengerDetails() when $default != null:
return $default(_that.passenger,_that.fullName,_that.driverPhone,_that.profileImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PassengerDetails implements PassengerDetails {
  const _PassengerDetails({required this.passenger, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "phone") required this.driverPhone, @JsonKey(name: "profile_image") this.profileImage});
  factory _PassengerDetails.fromJson(Map<String, dynamic> json) => _$PassengerDetailsFromJson(json);

@override final  String passenger;
@override@JsonKey(name: "full_name") final  String? fullName;
@override@JsonKey(name: "phone") final  String? driverPhone;
@override@JsonKey(name: "profile_image") final  String? profileImage;

/// Create a copy of PassengerDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassengerDetailsCopyWith<_PassengerDetails> get copyWith => __$PassengerDetailsCopyWithImpl<_PassengerDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PassengerDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PassengerDetails&&(identical(other.passenger, passenger) || other.passenger == passenger)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passenger,fullName,driverPhone,profileImage);

@override
String toString() {
  return 'PassengerDetails(passenger: $passenger, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage)';
}


}

/// @nodoc
abstract mixin class _$PassengerDetailsCopyWith<$Res> implements $PassengerDetailsCopyWith<$Res> {
  factory _$PassengerDetailsCopyWith(_PassengerDetails value, $Res Function(_PassengerDetails) _then) = __$PassengerDetailsCopyWithImpl;
@override @useResult
$Res call({
 String passenger,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "phone") String? driverPhone,@JsonKey(name: "profile_image") String? profileImage
});




}
/// @nodoc
class __$PassengerDetailsCopyWithImpl<$Res>
    implements _$PassengerDetailsCopyWith<$Res> {
  __$PassengerDetailsCopyWithImpl(this._self, this._then);

  final _PassengerDetails _self;
  final $Res Function(_PassengerDetails) _then;

/// Create a copy of PassengerDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passenger = null,Object? fullName = freezed,Object? driverPhone = freezed,Object? profileImage = freezed,}) {
  return _then(_PassengerDetails(
passenger: null == passenger ? _self.passenger : passenger // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,driverPhone: freezed == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
