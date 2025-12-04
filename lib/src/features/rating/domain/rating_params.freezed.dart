// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingParams {

@JsonKey(name: 'driver_id') String get driverId;@JsonKey(name: 'rating') String get rating;@JsonKey(includeIfNull: false) String? get comment;@JsonKey(includeIfNull: false, name: 'reference_doctype') String? get referenceDoctype;@JsonKey(includeIfNull: false, name: 'reference_name') String? get referenceName;
/// Create a copy of RatingParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingParamsCopyWith<RatingParams> get copyWith => _$RatingParamsCopyWithImpl<RatingParams>(this as RatingParams, _$identity);

  /// Serializes this RatingParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingParams&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.referenceDoctype, referenceDoctype) || other.referenceDoctype == referenceDoctype)&&(identical(other.referenceName, referenceName) || other.referenceName == referenceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,rating,comment,referenceDoctype,referenceName);

@override
String toString() {
  return 'RatingParams(driverId: $driverId, rating: $rating, comment: $comment, referenceDoctype: $referenceDoctype, referenceName: $referenceName)';
}


}

/// @nodoc
abstract mixin class $RatingParamsCopyWith<$Res>  {
  factory $RatingParamsCopyWith(RatingParams value, $Res Function(RatingParams) _then) = _$RatingParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'driver_id') String driverId,@JsonKey(name: 'rating') String rating,@JsonKey(includeIfNull: false) String? comment,@JsonKey(includeIfNull: false, name: 'reference_doctype') String? referenceDoctype,@JsonKey(includeIfNull: false, name: 'reference_name') String? referenceName
});




}
/// @nodoc
class _$RatingParamsCopyWithImpl<$Res>
    implements $RatingParamsCopyWith<$Res> {
  _$RatingParamsCopyWithImpl(this._self, this._then);

  final RatingParams _self;
  final $Res Function(RatingParams) _then;

/// Create a copy of RatingParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? driverId = null,Object? rating = null,Object? comment = freezed,Object? referenceDoctype = freezed,Object? referenceName = freezed,}) {
  return _then(_self.copyWith(
driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,referenceDoctype: freezed == referenceDoctype ? _self.referenceDoctype : referenceDoctype // ignore: cast_nullable_to_non_nullable
as String?,referenceName: freezed == referenceName ? _self.referenceName : referenceName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingParams].
extension RatingParamsPatterns on RatingParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingParams value)  $default,){
final _that = this;
switch (_that) {
case _RatingParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingParams value)?  $default,){
final _that = this;
switch (_that) {
case _RatingParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'driver_id')  String driverId, @JsonKey(name: 'rating')  String rating, @JsonKey(includeIfNull: false)  String? comment, @JsonKey(includeIfNull: false, name: 'reference_doctype')  String? referenceDoctype, @JsonKey(includeIfNull: false, name: 'reference_name')  String? referenceName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingParams() when $default != null:
return $default(_that.driverId,_that.rating,_that.comment,_that.referenceDoctype,_that.referenceName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'driver_id')  String driverId, @JsonKey(name: 'rating')  String rating, @JsonKey(includeIfNull: false)  String? comment, @JsonKey(includeIfNull: false, name: 'reference_doctype')  String? referenceDoctype, @JsonKey(includeIfNull: false, name: 'reference_name')  String? referenceName)  $default,) {final _that = this;
switch (_that) {
case _RatingParams():
return $default(_that.driverId,_that.rating,_that.comment,_that.referenceDoctype,_that.referenceName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'driver_id')  String driverId, @JsonKey(name: 'rating')  String rating, @JsonKey(includeIfNull: false)  String? comment, @JsonKey(includeIfNull: false, name: 'reference_doctype')  String? referenceDoctype, @JsonKey(includeIfNull: false, name: 'reference_name')  String? referenceName)?  $default,) {final _that = this;
switch (_that) {
case _RatingParams() when $default != null:
return $default(_that.driverId,_that.rating,_that.comment,_that.referenceDoctype,_that.referenceName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingParams implements RatingParams {
  const _RatingParams({@JsonKey(name: 'driver_id') required this.driverId, @JsonKey(name: 'rating') required this.rating, @JsonKey(includeIfNull: false) this.comment, @JsonKey(includeIfNull: false, name: 'reference_doctype') this.referenceDoctype, @JsonKey(includeIfNull: false, name: 'reference_name') this.referenceName});
  factory _RatingParams.fromJson(Map<String, dynamic> json) => _$RatingParamsFromJson(json);

@override@JsonKey(name: 'driver_id') final  String driverId;
@override@JsonKey(name: 'rating') final  String rating;
@override@JsonKey(includeIfNull: false) final  String? comment;
@override@JsonKey(includeIfNull: false, name: 'reference_doctype') final  String? referenceDoctype;
@override@JsonKey(includeIfNull: false, name: 'reference_name') final  String? referenceName;

/// Create a copy of RatingParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingParamsCopyWith<_RatingParams> get copyWith => __$RatingParamsCopyWithImpl<_RatingParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingParams&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.referenceDoctype, referenceDoctype) || other.referenceDoctype == referenceDoctype)&&(identical(other.referenceName, referenceName) || other.referenceName == referenceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,driverId,rating,comment,referenceDoctype,referenceName);

@override
String toString() {
  return 'RatingParams(driverId: $driverId, rating: $rating, comment: $comment, referenceDoctype: $referenceDoctype, referenceName: $referenceName)';
}


}

/// @nodoc
abstract mixin class _$RatingParamsCopyWith<$Res> implements $RatingParamsCopyWith<$Res> {
  factory _$RatingParamsCopyWith(_RatingParams value, $Res Function(_RatingParams) _then) = __$RatingParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'driver_id') String driverId,@JsonKey(name: 'rating') String rating,@JsonKey(includeIfNull: false) String? comment,@JsonKey(includeIfNull: false, name: 'reference_doctype') String? referenceDoctype,@JsonKey(includeIfNull: false, name: 'reference_name') String? referenceName
});




}
/// @nodoc
class __$RatingParamsCopyWithImpl<$Res>
    implements _$RatingParamsCopyWith<$Res> {
  __$RatingParamsCopyWithImpl(this._self, this._then);

  final _RatingParams _self;
  final $Res Function(_RatingParams) _then;

/// Create a copy of RatingParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? driverId = null,Object? rating = null,Object? comment = freezed,Object? referenceDoctype = freezed,Object? referenceName = freezed,}) {
  return _then(_RatingParams(
driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as String,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,referenceDoctype: freezed == referenceDoctype ? _self.referenceDoctype : referenceDoctype // ignore: cast_nullable_to_non_nullable
as String?,referenceName: freezed == referenceName ? _self.referenceName : referenceName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
