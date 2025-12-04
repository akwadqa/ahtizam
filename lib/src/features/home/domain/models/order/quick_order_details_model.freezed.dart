// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuickOrderDetailsModel {

@JsonKey(name: "order_status") String get status;@JsonKey(name: "driver_data") DriverQuickOrderModel? get driverData;@JsonKey(name: "offers") List<DriverOfferModel>? get offers;
/// Create a copy of QuickOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickOrderDetailsModelCopyWith<QuickOrderDetailsModel> get copyWith => _$QuickOrderDetailsModelCopyWithImpl<QuickOrderDetailsModel>(this as QuickOrderDetailsModel, _$identity);

  /// Serializes this QuickOrderDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickOrderDetailsModel&&(identical(other.status, status) || other.status == status)&&(identical(other.driverData, driverData) || other.driverData == driverData)&&const DeepCollectionEquality().equals(other.offers, offers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,driverData,const DeepCollectionEquality().hash(offers));

@override
String toString() {
  return 'QuickOrderDetailsModel(status: $status, driverData: $driverData, offers: $offers)';
}


}

/// @nodoc
abstract mixin class $QuickOrderDetailsModelCopyWith<$Res>  {
  factory $QuickOrderDetailsModelCopyWith(QuickOrderDetailsModel value, $Res Function(QuickOrderDetailsModel) _then) = _$QuickOrderDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "order_status") String status,@JsonKey(name: "driver_data") DriverQuickOrderModel? driverData,@JsonKey(name: "offers") List<DriverOfferModel>? offers
});


$DriverQuickOrderModelCopyWith<$Res>? get driverData;

}
/// @nodoc
class _$QuickOrderDetailsModelCopyWithImpl<$Res>
    implements $QuickOrderDetailsModelCopyWith<$Res> {
  _$QuickOrderDetailsModelCopyWithImpl(this._self, this._then);

  final QuickOrderDetailsModel _self;
  final $Res Function(QuickOrderDetailsModel) _then;

/// Create a copy of QuickOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? driverData = freezed,Object? offers = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,driverData: freezed == driverData ? _self.driverData : driverData // ignore: cast_nullable_to_non_nullable
as DriverQuickOrderModel?,offers: freezed == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<DriverOfferModel>?,
  ));
}
/// Create a copy of QuickOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverQuickOrderModelCopyWith<$Res>? get driverData {
    if (_self.driverData == null) {
    return null;
  }

  return $DriverQuickOrderModelCopyWith<$Res>(_self.driverData!, (value) {
    return _then(_self.copyWith(driverData: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuickOrderDetailsModel].
extension QuickOrderDetailsModelPatterns on QuickOrderDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickOrderDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickOrderDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickOrderDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _QuickOrderDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickOrderDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuickOrderDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "order_status")  String status, @JsonKey(name: "driver_data")  DriverQuickOrderModel? driverData, @JsonKey(name: "offers")  List<DriverOfferModel>? offers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickOrderDetailsModel() when $default != null:
return $default(_that.status,_that.driverData,_that.offers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "order_status")  String status, @JsonKey(name: "driver_data")  DriverQuickOrderModel? driverData, @JsonKey(name: "offers")  List<DriverOfferModel>? offers)  $default,) {final _that = this;
switch (_that) {
case _QuickOrderDetailsModel():
return $default(_that.status,_that.driverData,_that.offers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "order_status")  String status, @JsonKey(name: "driver_data")  DriverQuickOrderModel? driverData, @JsonKey(name: "offers")  List<DriverOfferModel>? offers)?  $default,) {final _that = this;
switch (_that) {
case _QuickOrderDetailsModel() when $default != null:
return $default(_that.status,_that.driverData,_that.offers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuickOrderDetailsModel implements QuickOrderDetailsModel {
  const _QuickOrderDetailsModel({@JsonKey(name: "order_status") required this.status, @JsonKey(name: "driver_data") required this.driverData, @JsonKey(name: "offers") required final  List<DriverOfferModel>? offers}): _offers = offers;
  factory _QuickOrderDetailsModel.fromJson(Map<String, dynamic> json) => _$QuickOrderDetailsModelFromJson(json);

@override@JsonKey(name: "order_status") final  String status;
@override@JsonKey(name: "driver_data") final  DriverQuickOrderModel? driverData;
 final  List<DriverOfferModel>? _offers;
@override@JsonKey(name: "offers") List<DriverOfferModel>? get offers {
  final value = _offers;
  if (value == null) return null;
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuickOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickOrderDetailsModelCopyWith<_QuickOrderDetailsModel> get copyWith => __$QuickOrderDetailsModelCopyWithImpl<_QuickOrderDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuickOrderDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickOrderDetailsModel&&(identical(other.status, status) || other.status == status)&&(identical(other.driverData, driverData) || other.driverData == driverData)&&const DeepCollectionEquality().equals(other._offers, _offers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,driverData,const DeepCollectionEquality().hash(_offers));

@override
String toString() {
  return 'QuickOrderDetailsModel(status: $status, driverData: $driverData, offers: $offers)';
}


}

/// @nodoc
abstract mixin class _$QuickOrderDetailsModelCopyWith<$Res> implements $QuickOrderDetailsModelCopyWith<$Res> {
  factory _$QuickOrderDetailsModelCopyWith(_QuickOrderDetailsModel value, $Res Function(_QuickOrderDetailsModel) _then) = __$QuickOrderDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "order_status") String status,@JsonKey(name: "driver_data") DriverQuickOrderModel? driverData,@JsonKey(name: "offers") List<DriverOfferModel>? offers
});


@override $DriverQuickOrderModelCopyWith<$Res>? get driverData;

}
/// @nodoc
class __$QuickOrderDetailsModelCopyWithImpl<$Res>
    implements _$QuickOrderDetailsModelCopyWith<$Res> {
  __$QuickOrderDetailsModelCopyWithImpl(this._self, this._then);

  final _QuickOrderDetailsModel _self;
  final $Res Function(_QuickOrderDetailsModel) _then;

/// Create a copy of QuickOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? driverData = freezed,Object? offers = freezed,}) {
  return _then(_QuickOrderDetailsModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,driverData: freezed == driverData ? _self.driverData : driverData // ignore: cast_nullable_to_non_nullable
as DriverQuickOrderModel?,offers: freezed == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<DriverOfferModel>?,
  ));
}

/// Create a copy of QuickOrderDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverQuickOrderModelCopyWith<$Res>? get driverData {
    if (_self.driverData == null) {
    return null;
  }

  return $DriverQuickOrderModelCopyWith<$Res>(_self.driverData!, (value) {
    return _then(_self.copyWith(driverData: value));
  });
}
}

// dart format on
