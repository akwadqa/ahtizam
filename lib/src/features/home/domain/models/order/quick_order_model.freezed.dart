// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuickOrderModel {

@JsonKey(name: "quick_order_id") String get quickOrderId;@JsonKey(name: "base_fee") double get baseFee;@JsonKey(name: "tax_fee") double get taxFee;@JsonKey(name: "discount_cost") double? get discountCost;@JsonKey(name: "final_fee") double get finalFee;//  distance, duration
 String get eta;
/// Create a copy of QuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickOrderModelCopyWith<QuickOrderModel> get copyWith => _$QuickOrderModelCopyWithImpl<QuickOrderModel>(this as QuickOrderModel, _$identity);

  /// Serializes this QuickOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickOrderModel&&(identical(other.quickOrderId, quickOrderId) || other.quickOrderId == quickOrderId)&&(identical(other.baseFee, baseFee) || other.baseFee == baseFee)&&(identical(other.taxFee, taxFee) || other.taxFee == taxFee)&&(identical(other.discountCost, discountCost) || other.discountCost == discountCost)&&(identical(other.finalFee, finalFee) || other.finalFee == finalFee)&&(identical(other.eta, eta) || other.eta == eta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderId,baseFee,taxFee,discountCost,finalFee,eta);

@override
String toString() {
  return 'QuickOrderModel(quickOrderId: $quickOrderId, baseFee: $baseFee, taxFee: $taxFee, discountCost: $discountCost, finalFee: $finalFee, eta: $eta)';
}


}

/// @nodoc
abstract mixin class $QuickOrderModelCopyWith<$Res>  {
  factory $QuickOrderModelCopyWith(QuickOrderModel value, $Res Function(QuickOrderModel) _then) = _$QuickOrderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "quick_order_id") String quickOrderId,@JsonKey(name: "base_fee") double baseFee,@JsonKey(name: "tax_fee") double taxFee,@JsonKey(name: "discount_cost") double? discountCost,@JsonKey(name: "final_fee") double finalFee, String eta
});




}
/// @nodoc
class _$QuickOrderModelCopyWithImpl<$Res>
    implements $QuickOrderModelCopyWith<$Res> {
  _$QuickOrderModelCopyWithImpl(this._self, this._then);

  final QuickOrderModel _self;
  final $Res Function(QuickOrderModel) _then;

/// Create a copy of QuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quickOrderId = null,Object? baseFee = null,Object? taxFee = null,Object? discountCost = freezed,Object? finalFee = null,Object? eta = null,}) {
  return _then(_self.copyWith(
quickOrderId: null == quickOrderId ? _self.quickOrderId : quickOrderId // ignore: cast_nullable_to_non_nullable
as String,baseFee: null == baseFee ? _self.baseFee : baseFee // ignore: cast_nullable_to_non_nullable
as double,taxFee: null == taxFee ? _self.taxFee : taxFee // ignore: cast_nullable_to_non_nullable
as double,discountCost: freezed == discountCost ? _self.discountCost : discountCost // ignore: cast_nullable_to_non_nullable
as double?,finalFee: null == finalFee ? _self.finalFee : finalFee // ignore: cast_nullable_to_non_nullable
as double,eta: null == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuickOrderModel].
extension QuickOrderModelPatterns on QuickOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _QuickOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuickOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "quick_order_id")  String quickOrderId, @JsonKey(name: "base_fee")  double baseFee, @JsonKey(name: "tax_fee")  double taxFee, @JsonKey(name: "discount_cost")  double? discountCost, @JsonKey(name: "final_fee")  double finalFee,  String eta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickOrderModel() when $default != null:
return $default(_that.quickOrderId,_that.baseFee,_that.taxFee,_that.discountCost,_that.finalFee,_that.eta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "quick_order_id")  String quickOrderId, @JsonKey(name: "base_fee")  double baseFee, @JsonKey(name: "tax_fee")  double taxFee, @JsonKey(name: "discount_cost")  double? discountCost, @JsonKey(name: "final_fee")  double finalFee,  String eta)  $default,) {final _that = this;
switch (_that) {
case _QuickOrderModel():
return $default(_that.quickOrderId,_that.baseFee,_that.taxFee,_that.discountCost,_that.finalFee,_that.eta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "quick_order_id")  String quickOrderId, @JsonKey(name: "base_fee")  double baseFee, @JsonKey(name: "tax_fee")  double taxFee, @JsonKey(name: "discount_cost")  double? discountCost, @JsonKey(name: "final_fee")  double finalFee,  String eta)?  $default,) {final _that = this;
switch (_that) {
case _QuickOrderModel() when $default != null:
return $default(_that.quickOrderId,_that.baseFee,_that.taxFee,_that.discountCost,_that.finalFee,_that.eta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuickOrderModel implements QuickOrderModel {
  const _QuickOrderModel({@JsonKey(name: "quick_order_id") required this.quickOrderId, @JsonKey(name: "base_fee") required this.baseFee, @JsonKey(name: "tax_fee") required this.taxFee, @JsonKey(name: "discount_cost") required this.discountCost, @JsonKey(name: "final_fee") required this.finalFee, required this.eta});
  factory _QuickOrderModel.fromJson(Map<String, dynamic> json) => _$QuickOrderModelFromJson(json);

@override@JsonKey(name: "quick_order_id") final  String quickOrderId;
@override@JsonKey(name: "base_fee") final  double baseFee;
@override@JsonKey(name: "tax_fee") final  double taxFee;
@override@JsonKey(name: "discount_cost") final  double? discountCost;
@override@JsonKey(name: "final_fee") final  double finalFee;
//  distance, duration
@override final  String eta;

/// Create a copy of QuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickOrderModelCopyWith<_QuickOrderModel> get copyWith => __$QuickOrderModelCopyWithImpl<_QuickOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuickOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickOrderModel&&(identical(other.quickOrderId, quickOrderId) || other.quickOrderId == quickOrderId)&&(identical(other.baseFee, baseFee) || other.baseFee == baseFee)&&(identical(other.taxFee, taxFee) || other.taxFee == taxFee)&&(identical(other.discountCost, discountCost) || other.discountCost == discountCost)&&(identical(other.finalFee, finalFee) || other.finalFee == finalFee)&&(identical(other.eta, eta) || other.eta == eta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quickOrderId,baseFee,taxFee,discountCost,finalFee,eta);

@override
String toString() {
  return 'QuickOrderModel(quickOrderId: $quickOrderId, baseFee: $baseFee, taxFee: $taxFee, discountCost: $discountCost, finalFee: $finalFee, eta: $eta)';
}


}

/// @nodoc
abstract mixin class _$QuickOrderModelCopyWith<$Res> implements $QuickOrderModelCopyWith<$Res> {
  factory _$QuickOrderModelCopyWith(_QuickOrderModel value, $Res Function(_QuickOrderModel) _then) = __$QuickOrderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "quick_order_id") String quickOrderId,@JsonKey(name: "base_fee") double baseFee,@JsonKey(name: "tax_fee") double taxFee,@JsonKey(name: "discount_cost") double? discountCost,@JsonKey(name: "final_fee") double finalFee, String eta
});




}
/// @nodoc
class __$QuickOrderModelCopyWithImpl<$Res>
    implements _$QuickOrderModelCopyWith<$Res> {
  __$QuickOrderModelCopyWithImpl(this._self, this._then);

  final _QuickOrderModel _self;
  final $Res Function(_QuickOrderModel) _then;

/// Create a copy of QuickOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quickOrderId = null,Object? baseFee = null,Object? taxFee = null,Object? discountCost = freezed,Object? finalFee = null,Object? eta = null,}) {
  return _then(_QuickOrderModel(
quickOrderId: null == quickOrderId ? _self.quickOrderId : quickOrderId // ignore: cast_nullable_to_non_nullable
as String,baseFee: null == baseFee ? _self.baseFee : baseFee // ignore: cast_nullable_to_non_nullable
as double,taxFee: null == taxFee ? _self.taxFee : taxFee // ignore: cast_nullable_to_non_nullable
as double,discountCost: freezed == discountCost ? _self.discountCost : discountCost // ignore: cast_nullable_to_non_nullable
as double?,finalFee: null == finalFee ? _self.finalFee : finalFee // ignore: cast_nullable_to_non_nullable
as double,eta: null == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
