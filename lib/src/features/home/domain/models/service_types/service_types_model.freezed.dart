// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceTypesModel _$ServiceTypesModelFromJson(Map<String, dynamic> json) {
  return _ServiceTypesModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceTypesModel {
  @JsonKey(name: "service_id")
  String get serviceId => throw _privateConstructorUsedError;
  @JsonKey(name: "service_item")
  String get serviceItem => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicles_size")
  String get vehiclesSize => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_capacity")
  String get vehicleCapacity => throw _privateConstructorUsedError;
  @JsonKey(name: "service_cost_per_km")
  double get serviceCostPerKm => throw _privateConstructorUsedError;

  /// Serializes this ServiceTypesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceTypesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceTypesModelCopyWith<ServiceTypesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceTypesModelCopyWith<$Res> {
  factory $ServiceTypesModelCopyWith(
          ServiceTypesModel value, $Res Function(ServiceTypesModel) then) =
      _$ServiceTypesModelCopyWithImpl<$Res, ServiceTypesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "service_id") String serviceId,
      @JsonKey(name: "service_item") String serviceItem,
      @JsonKey(name: "vehicles_size") String vehiclesSize,
      @JsonKey(name: "vehicle_capacity") String vehicleCapacity,
      @JsonKey(name: "service_cost_per_km") double serviceCostPerKm});
}

/// @nodoc
class _$ServiceTypesModelCopyWithImpl<$Res, $Val extends ServiceTypesModel>
    implements $ServiceTypesModelCopyWith<$Res> {
  _$ServiceTypesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceTypesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? serviceItem = null,
    Object? vehiclesSize = null,
    Object? vehicleCapacity = null,
    Object? serviceCostPerKm = null,
  }) {
    return _then(_value.copyWith(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceItem: null == serviceItem
          ? _value.serviceItem
          : serviceItem // ignore: cast_nullable_to_non_nullable
              as String,
      vehiclesSize: null == vehiclesSize
          ? _value.vehiclesSize
          : vehiclesSize // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleCapacity: null == vehicleCapacity
          ? _value.vehicleCapacity
          : vehicleCapacity // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCostPerKm: null == serviceCostPerKm
          ? _value.serviceCostPerKm
          : serviceCostPerKm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceTypesModelImplCopyWith<$Res>
    implements $ServiceTypesModelCopyWith<$Res> {
  factory _$$ServiceTypesModelImplCopyWith(_$ServiceTypesModelImpl value,
          $Res Function(_$ServiceTypesModelImpl) then) =
      __$$ServiceTypesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "service_id") String serviceId,
      @JsonKey(name: "service_item") String serviceItem,
      @JsonKey(name: "vehicles_size") String vehiclesSize,
      @JsonKey(name: "vehicle_capacity") String vehicleCapacity,
      @JsonKey(name: "service_cost_per_km") double serviceCostPerKm});
}

/// @nodoc
class __$$ServiceTypesModelImplCopyWithImpl<$Res>
    extends _$ServiceTypesModelCopyWithImpl<$Res, _$ServiceTypesModelImpl>
    implements _$$ServiceTypesModelImplCopyWith<$Res> {
  __$$ServiceTypesModelImplCopyWithImpl(_$ServiceTypesModelImpl _value,
      $Res Function(_$ServiceTypesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceTypesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceId = null,
    Object? serviceItem = null,
    Object? vehiclesSize = null,
    Object? vehicleCapacity = null,
    Object? serviceCostPerKm = null,
  }) {
    return _then(_$ServiceTypesModelImpl(
      serviceId: null == serviceId
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceItem: null == serviceItem
          ? _value.serviceItem
          : serviceItem // ignore: cast_nullable_to_non_nullable
              as String,
      vehiclesSize: null == vehiclesSize
          ? _value.vehiclesSize
          : vehiclesSize // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleCapacity: null == vehicleCapacity
          ? _value.vehicleCapacity
          : vehicleCapacity // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCostPerKm: null == serviceCostPerKm
          ? _value.serviceCostPerKm
          : serviceCostPerKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceTypesModelImpl implements _ServiceTypesModel {
  _$ServiceTypesModelImpl(
      {@JsonKey(name: "service_id") required this.serviceId,
      @JsonKey(name: "service_item") required this.serviceItem,
      @JsonKey(name: "vehicles_size") required this.vehiclesSize,
      @JsonKey(name: "vehicle_capacity") required this.vehicleCapacity,
      @JsonKey(name: "service_cost_per_km") required this.serviceCostPerKm});

  factory _$ServiceTypesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceTypesModelImplFromJson(json);

  @override
  @JsonKey(name: "service_id")
  final String serviceId;
  @override
  @JsonKey(name: "service_item")
  final String serviceItem;
  @override
  @JsonKey(name: "vehicles_size")
  final String vehiclesSize;
  @override
  @JsonKey(name: "vehicle_capacity")
  final String vehicleCapacity;
  @override
  @JsonKey(name: "service_cost_per_km")
  final double serviceCostPerKm;

  @override
  String toString() {
    return 'ServiceTypesModel(serviceId: $serviceId, serviceItem: $serviceItem, vehiclesSize: $vehiclesSize, vehicleCapacity: $vehicleCapacity, serviceCostPerKm: $serviceCostPerKm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceTypesModelImpl &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.serviceItem, serviceItem) ||
                other.serviceItem == serviceItem) &&
            (identical(other.vehiclesSize, vehiclesSize) ||
                other.vehiclesSize == vehiclesSize) &&
            (identical(other.vehicleCapacity, vehicleCapacity) ||
                other.vehicleCapacity == vehicleCapacity) &&
            (identical(other.serviceCostPerKm, serviceCostPerKm) ||
                other.serviceCostPerKm == serviceCostPerKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceId, serviceItem,
      vehiclesSize, vehicleCapacity, serviceCostPerKm);

  /// Create a copy of ServiceTypesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceTypesModelImplCopyWith<_$ServiceTypesModelImpl> get copyWith =>
      __$$ServiceTypesModelImplCopyWithImpl<_$ServiceTypesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceTypesModelImplToJson(
      this,
    );
  }
}

abstract class _ServiceTypesModel implements ServiceTypesModel {
  factory _ServiceTypesModel(
      {@JsonKey(name: "service_id") required final String serviceId,
      @JsonKey(name: "service_item") required final String serviceItem,
      @JsonKey(name: "vehicles_size") required final String vehiclesSize,
      @JsonKey(name: "vehicle_capacity") required final String vehicleCapacity,
      @JsonKey(name: "service_cost_per_km")
      required final double serviceCostPerKm}) = _$ServiceTypesModelImpl;

  factory _ServiceTypesModel.fromJson(Map<String, dynamic> json) =
      _$ServiceTypesModelImpl.fromJson;

  @override
  @JsonKey(name: "service_id")
  String get serviceId;
  @override
  @JsonKey(name: "service_item")
  String get serviceItem;
  @override
  @JsonKey(name: "vehicles_size")
  String get vehiclesSize;
  @override
  @JsonKey(name: "vehicle_capacity")
  String get vehicleCapacity;
  @override
  @JsonKey(name: "service_cost_per_km")
  double get serviceCostPerKm;

  /// Create a copy of ServiceTypesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceTypesModelImplCopyWith<_$ServiceTypesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
