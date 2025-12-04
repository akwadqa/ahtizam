// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceTypesModel {

@JsonKey(name: "service_id") String get serviceId;@JsonKey(name: "service_item") String get serviceItem;@JsonKey(name: "vehicles_size") String get vehiclesSize;@JsonKey(name: "vehicle_capacity") String get vehicleCapacity;@JsonKey(name: "service_cost_per_km") double get serviceCostPerKm;
/// Create a copy of ServiceTypesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceTypesModelCopyWith<ServiceTypesModel> get copyWith => _$ServiceTypesModelCopyWithImpl<ServiceTypesModel>(this as ServiceTypesModel, _$identity);

  /// Serializes this ServiceTypesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceTypesModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceItem, serviceItem) || other.serviceItem == serviceItem)&&(identical(other.vehiclesSize, vehiclesSize) || other.vehiclesSize == vehiclesSize)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.serviceCostPerKm, serviceCostPerKm) || other.serviceCostPerKm == serviceCostPerKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceItem,vehiclesSize,vehicleCapacity,serviceCostPerKm);

@override
String toString() {
  return 'ServiceTypesModel(serviceId: $serviceId, serviceItem: $serviceItem, vehiclesSize: $vehiclesSize, vehicleCapacity: $vehicleCapacity, serviceCostPerKm: $serviceCostPerKm)';
}


}

/// @nodoc
abstract mixin class $ServiceTypesModelCopyWith<$Res>  {
  factory $ServiceTypesModelCopyWith(ServiceTypesModel value, $Res Function(ServiceTypesModel) _then) = _$ServiceTypesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "service_id") String serviceId,@JsonKey(name: "service_item") String serviceItem,@JsonKey(name: "vehicles_size") String vehiclesSize,@JsonKey(name: "vehicle_capacity") String vehicleCapacity,@JsonKey(name: "service_cost_per_km") double serviceCostPerKm
});




}
/// @nodoc
class _$ServiceTypesModelCopyWithImpl<$Res>
    implements $ServiceTypesModelCopyWith<$Res> {
  _$ServiceTypesModelCopyWithImpl(this._self, this._then);

  final ServiceTypesModel _self;
  final $Res Function(ServiceTypesModel) _then;

/// Create a copy of ServiceTypesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceId = null,Object? serviceItem = null,Object? vehiclesSize = null,Object? vehicleCapacity = null,Object? serviceCostPerKm = null,}) {
  return _then(_self.copyWith(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,serviceItem: null == serviceItem ? _self.serviceItem : serviceItem // ignore: cast_nullable_to_non_nullable
as String,vehiclesSize: null == vehiclesSize ? _self.vehiclesSize : vehiclesSize // ignore: cast_nullable_to_non_nullable
as String,vehicleCapacity: null == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as String,serviceCostPerKm: null == serviceCostPerKm ? _self.serviceCostPerKm : serviceCostPerKm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceTypesModel].
extension ServiceTypesModelPatterns on ServiceTypesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceTypesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceTypesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceTypesModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceTypesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceTypesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceTypesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "service_id")  String serviceId, @JsonKey(name: "service_item")  String serviceItem, @JsonKey(name: "vehicles_size")  String vehiclesSize, @JsonKey(name: "vehicle_capacity")  String vehicleCapacity, @JsonKey(name: "service_cost_per_km")  double serviceCostPerKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceTypesModel() when $default != null:
return $default(_that.serviceId,_that.serviceItem,_that.vehiclesSize,_that.vehicleCapacity,_that.serviceCostPerKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "service_id")  String serviceId, @JsonKey(name: "service_item")  String serviceItem, @JsonKey(name: "vehicles_size")  String vehiclesSize, @JsonKey(name: "vehicle_capacity")  String vehicleCapacity, @JsonKey(name: "service_cost_per_km")  double serviceCostPerKm)  $default,) {final _that = this;
switch (_that) {
case _ServiceTypesModel():
return $default(_that.serviceId,_that.serviceItem,_that.vehiclesSize,_that.vehicleCapacity,_that.serviceCostPerKm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "service_id")  String serviceId, @JsonKey(name: "service_item")  String serviceItem, @JsonKey(name: "vehicles_size")  String vehiclesSize, @JsonKey(name: "vehicle_capacity")  String vehicleCapacity, @JsonKey(name: "service_cost_per_km")  double serviceCostPerKm)?  $default,) {final _that = this;
switch (_that) {
case _ServiceTypesModel() when $default != null:
return $default(_that.serviceId,_that.serviceItem,_that.vehiclesSize,_that.vehicleCapacity,_that.serviceCostPerKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceTypesModel implements ServiceTypesModel {
   _ServiceTypesModel({@JsonKey(name: "service_id") required this.serviceId, @JsonKey(name: "service_item") required this.serviceItem, @JsonKey(name: "vehicles_size") required this.vehiclesSize, @JsonKey(name: "vehicle_capacity") required this.vehicleCapacity, @JsonKey(name: "service_cost_per_km") required this.serviceCostPerKm});
  factory _ServiceTypesModel.fromJson(Map<String, dynamic> json) => _$ServiceTypesModelFromJson(json);

@override@JsonKey(name: "service_id") final  String serviceId;
@override@JsonKey(name: "service_item") final  String serviceItem;
@override@JsonKey(name: "vehicles_size") final  String vehiclesSize;
@override@JsonKey(name: "vehicle_capacity") final  String vehicleCapacity;
@override@JsonKey(name: "service_cost_per_km") final  double serviceCostPerKm;

/// Create a copy of ServiceTypesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceTypesModelCopyWith<_ServiceTypesModel> get copyWith => __$ServiceTypesModelCopyWithImpl<_ServiceTypesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceTypesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceTypesModel&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId)&&(identical(other.serviceItem, serviceItem) || other.serviceItem == serviceItem)&&(identical(other.vehiclesSize, vehiclesSize) || other.vehiclesSize == vehiclesSize)&&(identical(other.vehicleCapacity, vehicleCapacity) || other.vehicleCapacity == vehicleCapacity)&&(identical(other.serviceCostPerKm, serviceCostPerKm) || other.serviceCostPerKm == serviceCostPerKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceId,serviceItem,vehiclesSize,vehicleCapacity,serviceCostPerKm);

@override
String toString() {
  return 'ServiceTypesModel(serviceId: $serviceId, serviceItem: $serviceItem, vehiclesSize: $vehiclesSize, vehicleCapacity: $vehicleCapacity, serviceCostPerKm: $serviceCostPerKm)';
}


}

/// @nodoc
abstract mixin class _$ServiceTypesModelCopyWith<$Res> implements $ServiceTypesModelCopyWith<$Res> {
  factory _$ServiceTypesModelCopyWith(_ServiceTypesModel value, $Res Function(_ServiceTypesModel) _then) = __$ServiceTypesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "service_id") String serviceId,@JsonKey(name: "service_item") String serviceItem,@JsonKey(name: "vehicles_size") String vehiclesSize,@JsonKey(name: "vehicle_capacity") String vehicleCapacity,@JsonKey(name: "service_cost_per_km") double serviceCostPerKm
});




}
/// @nodoc
class __$ServiceTypesModelCopyWithImpl<$Res>
    implements _$ServiceTypesModelCopyWith<$Res> {
  __$ServiceTypesModelCopyWithImpl(this._self, this._then);

  final _ServiceTypesModel _self;
  final $Res Function(_ServiceTypesModel) _then;

/// Create a copy of ServiceTypesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceId = null,Object? serviceItem = null,Object? vehiclesSize = null,Object? vehicleCapacity = null,Object? serviceCostPerKm = null,}) {
  return _then(_ServiceTypesModel(
serviceId: null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as String,serviceItem: null == serviceItem ? _self.serviceItem : serviceItem // ignore: cast_nullable_to_non_nullable
as String,vehiclesSize: null == vehiclesSize ? _self.vehiclesSize : vehiclesSize // ignore: cast_nullable_to_non_nullable
as String,vehicleCapacity: null == vehicleCapacity ? _self.vehicleCapacity : vehicleCapacity // ignore: cast_nullable_to_non_nullable
as String,serviceCostPerKm: null == serviceCostPerKm ? _self.serviceCostPerKm : serviceCostPerKm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
