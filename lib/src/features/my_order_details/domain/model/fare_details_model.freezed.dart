// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FareDetails {

@JsonKey(name: "base_fare") double get baseFare;@JsonKey(name: "discount_amount") int? get discountAmount;@JsonKey(name: "tax_fee") double get taxFee;@JsonKey(name: "final_fare") double get finalFare;
/// Create a copy of FareDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FareDetailsCopyWith<FareDetails> get copyWith => _$FareDetailsCopyWithImpl<FareDetails>(this as FareDetails, _$identity);

  /// Serializes this FareDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FareDetails&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxFee, taxFee) || other.taxFee == taxFee)&&(identical(other.finalFare, finalFare) || other.finalFare == finalFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseFare,discountAmount,taxFee,finalFare);

@override
String toString() {
  return 'FareDetails(baseFare: $baseFare, discountAmount: $discountAmount, taxFee: $taxFee, finalFare: $finalFare)';
}


}

/// @nodoc
abstract mixin class $FareDetailsCopyWith<$Res>  {
  factory $FareDetailsCopyWith(FareDetails value, $Res Function(FareDetails) _then) = _$FareDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "base_fare") double baseFare,@JsonKey(name: "discount_amount") int? discountAmount,@JsonKey(name: "tax_fee") double taxFee,@JsonKey(name: "final_fare") double finalFare
});




}
/// @nodoc
class _$FareDetailsCopyWithImpl<$Res>
    implements $FareDetailsCopyWith<$Res> {
  _$FareDetailsCopyWithImpl(this._self, this._then);

  final FareDetails _self;
  final $Res Function(FareDetails) _then;

/// Create a copy of FareDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseFare = null,Object? discountAmount = freezed,Object? taxFee = null,Object? finalFare = null,}) {
  return _then(_self.copyWith(
baseFare: null == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,taxFee: null == taxFee ? _self.taxFee : taxFee // ignore: cast_nullable_to_non_nullable
as double,finalFare: null == finalFare ? _self.finalFare : finalFare // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FareDetails].
extension FareDetailsPatterns on FareDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FareDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FareDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FareDetails value)  $default,){
final _that = this;
switch (_that) {
case _FareDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FareDetails value)?  $default,){
final _that = this;
switch (_that) {
case _FareDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "base_fare")  double baseFare, @JsonKey(name: "discount_amount")  int? discountAmount, @JsonKey(name: "tax_fee")  double taxFee, @JsonKey(name: "final_fare")  double finalFare)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FareDetails() when $default != null:
return $default(_that.baseFare,_that.discountAmount,_that.taxFee,_that.finalFare);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "base_fare")  double baseFare, @JsonKey(name: "discount_amount")  int? discountAmount, @JsonKey(name: "tax_fee")  double taxFee, @JsonKey(name: "final_fare")  double finalFare)  $default,) {final _that = this;
switch (_that) {
case _FareDetails():
return $default(_that.baseFare,_that.discountAmount,_that.taxFee,_that.finalFare);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "base_fare")  double baseFare, @JsonKey(name: "discount_amount")  int? discountAmount, @JsonKey(name: "tax_fee")  double taxFee, @JsonKey(name: "final_fare")  double finalFare)?  $default,) {final _that = this;
switch (_that) {
case _FareDetails() when $default != null:
return $default(_that.baseFare,_that.discountAmount,_that.taxFee,_that.finalFare);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FareDetails implements FareDetails {
  const _FareDetails({@JsonKey(name: "base_fare") required this.baseFare, @JsonKey(name: "discount_amount") this.discountAmount, @JsonKey(name: "tax_fee") required this.taxFee, @JsonKey(name: "final_fare") required this.finalFare});
  factory _FareDetails.fromJson(Map<String, dynamic> json) => _$FareDetailsFromJson(json);

@override@JsonKey(name: "base_fare") final  double baseFare;
@override@JsonKey(name: "discount_amount") final  int? discountAmount;
@override@JsonKey(name: "tax_fee") final  double taxFee;
@override@JsonKey(name: "final_fare") final  double finalFare;

/// Create a copy of FareDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FareDetailsCopyWith<_FareDetails> get copyWith => __$FareDetailsCopyWithImpl<_FareDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FareDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FareDetails&&(identical(other.baseFare, baseFare) || other.baseFare == baseFare)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxFee, taxFee) || other.taxFee == taxFee)&&(identical(other.finalFare, finalFare) || other.finalFare == finalFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseFare,discountAmount,taxFee,finalFare);

@override
String toString() {
  return 'FareDetails(baseFare: $baseFare, discountAmount: $discountAmount, taxFee: $taxFee, finalFare: $finalFare)';
}


}

/// @nodoc
abstract mixin class _$FareDetailsCopyWith<$Res> implements $FareDetailsCopyWith<$Res> {
  factory _$FareDetailsCopyWith(_FareDetails value, $Res Function(_FareDetails) _then) = __$FareDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "base_fare") double baseFare,@JsonKey(name: "discount_amount") int? discountAmount,@JsonKey(name: "tax_fee") double taxFee,@JsonKey(name: "final_fare") double finalFare
});




}
/// @nodoc
class __$FareDetailsCopyWithImpl<$Res>
    implements _$FareDetailsCopyWith<$Res> {
  __$FareDetailsCopyWithImpl(this._self, this._then);

  final _FareDetails _self;
  final $Res Function(_FareDetails) _then;

/// Create a copy of FareDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseFare = null,Object? discountAmount = freezed,Object? taxFee = null,Object? finalFare = null,}) {
  return _then(_FareDetails(
baseFare: null == baseFare ? _self.baseFare : baseFare // ignore: cast_nullable_to_non_nullable
as double,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,taxFee: null == taxFee ? _self.taxFee : taxFee // ignore: cast_nullable_to_non_nullable
as double,finalFare: null == finalFare ? _self.finalFare : finalFare // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
