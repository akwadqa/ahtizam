// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverInfoModel {

@JsonKey(name: "service_type") String get serviceType;@JsonKey(name: "driver_qid") String get qid;@JsonKey(name: "driver_full_name") String get fullName;@JsonKey(name: "driver_phone_number") String get driverPhone;@JsonKey(name: "profile_image") String? get profileImage; double? get rating;
/// Create a copy of DriverInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverInfoModelCopyWith<DriverInfoModel> get copyWith => _$DriverInfoModelCopyWithImpl<DriverInfoModel>(this as DriverInfoModel, _$identity);

  /// Serializes this DriverInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverInfoModel&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.qid, qid) || other.qid == qid)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceType,qid,fullName,driverPhone,profileImage,rating);

@override
String toString() {
  return 'DriverInfoModel(serviceType: $serviceType, qid: $qid, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $DriverInfoModelCopyWith<$Res>  {
  factory $DriverInfoModelCopyWith(DriverInfoModel value, $Res Function(DriverInfoModel) _then) = _$DriverInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "service_type") String serviceType,@JsonKey(name: "driver_qid") String qid,@JsonKey(name: "driver_full_name") String fullName,@JsonKey(name: "driver_phone_number") String driverPhone,@JsonKey(name: "profile_image") String? profileImage, double? rating
});




}
/// @nodoc
class _$DriverInfoModelCopyWithImpl<$Res>
    implements $DriverInfoModelCopyWith<$Res> {
  _$DriverInfoModelCopyWithImpl(this._self, this._then);

  final DriverInfoModel _self;
  final $Res Function(DriverInfoModel) _then;

/// Create a copy of DriverInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceType = null,Object? qid = null,Object? fullName = null,Object? driverPhone = null,Object? profileImage = freezed,Object? rating = freezed,}) {
  return _then(_self.copyWith(
serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,qid: null == qid ? _self.qid : qid // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,driverPhone: null == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverInfoModel].
extension DriverInfoModelPatterns on DriverInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "service_type")  String serviceType, @JsonKey(name: "driver_qid")  String qid, @JsonKey(name: "driver_full_name")  String fullName, @JsonKey(name: "driver_phone_number")  String driverPhone, @JsonKey(name: "profile_image")  String? profileImage,  double? rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverInfoModel() when $default != null:
return $default(_that.serviceType,_that.qid,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "service_type")  String serviceType, @JsonKey(name: "driver_qid")  String qid, @JsonKey(name: "driver_full_name")  String fullName, @JsonKey(name: "driver_phone_number")  String driverPhone, @JsonKey(name: "profile_image")  String? profileImage,  double? rating)  $default,) {final _that = this;
switch (_that) {
case _DriverInfoModel():
return $default(_that.serviceType,_that.qid,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "service_type")  String serviceType, @JsonKey(name: "driver_qid")  String qid, @JsonKey(name: "driver_full_name")  String fullName, @JsonKey(name: "driver_phone_number")  String driverPhone, @JsonKey(name: "profile_image")  String? profileImage,  double? rating)?  $default,) {final _that = this;
switch (_that) {
case _DriverInfoModel() when $default != null:
return $default(_that.serviceType,_that.qid,_that.fullName,_that.driverPhone,_that.profileImage,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverInfoModel implements DriverInfoModel {
  const _DriverInfoModel({@JsonKey(name: "service_type") required this.serviceType, @JsonKey(name: "driver_qid") required this.qid, @JsonKey(name: "driver_full_name") required this.fullName, @JsonKey(name: "driver_phone_number") required this.driverPhone, @JsonKey(name: "profile_image") this.profileImage, required this.rating});
  factory _DriverInfoModel.fromJson(Map<String, dynamic> json) => _$DriverInfoModelFromJson(json);

@override@JsonKey(name: "service_type") final  String serviceType;
@override@JsonKey(name: "driver_qid") final  String qid;
@override@JsonKey(name: "driver_full_name") final  String fullName;
@override@JsonKey(name: "driver_phone_number") final  String driverPhone;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override final  double? rating;

/// Create a copy of DriverInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverInfoModelCopyWith<_DriverInfoModel> get copyWith => __$DriverInfoModelCopyWithImpl<_DriverInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverInfoModel&&(identical(other.serviceType, serviceType) || other.serviceType == serviceType)&&(identical(other.qid, qid) || other.qid == qid)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.driverPhone, driverPhone) || other.driverPhone == driverPhone)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceType,qid,fullName,driverPhone,profileImage,rating);

@override
String toString() {
  return 'DriverInfoModel(serviceType: $serviceType, qid: $qid, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$DriverInfoModelCopyWith<$Res> implements $DriverInfoModelCopyWith<$Res> {
  factory _$DriverInfoModelCopyWith(_DriverInfoModel value, $Res Function(_DriverInfoModel) _then) = __$DriverInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "service_type") String serviceType,@JsonKey(name: "driver_qid") String qid,@JsonKey(name: "driver_full_name") String fullName,@JsonKey(name: "driver_phone_number") String driverPhone,@JsonKey(name: "profile_image") String? profileImage, double? rating
});




}
/// @nodoc
class __$DriverInfoModelCopyWithImpl<$Res>
    implements _$DriverInfoModelCopyWith<$Res> {
  __$DriverInfoModelCopyWithImpl(this._self, this._then);

  final _DriverInfoModel _self;
  final $Res Function(_DriverInfoModel) _then;

/// Create a copy of DriverInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceType = null,Object? qid = null,Object? fullName = null,Object? driverPhone = null,Object? profileImage = freezed,Object? rating = freezed,}) {
  return _then(_DriverInfoModel(
serviceType: null == serviceType ? _self.serviceType : serviceType // ignore: cast_nullable_to_non_nullable
as String,qid: null == qid ? _self.qid : qid // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,driverPhone: null == driverPhone ? _self.driverPhone : driverPhone // ignore: cast_nullable_to_non_nullable
as String,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
