// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get pickupLocation => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get workshopLocation => throw _privateConstructorUsedError;
  String get truckType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get assignedDriverId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      @GeoPointConverter() GeoPoint pickupLocation,
      @GeoPointConverter() GeoPoint workshopLocation,
      String truckType,
      String status,
      String? assignedDriverId,
      DateTime createdAt,
      double price});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pickupLocation = null,
    Object? workshopLocation = null,
    Object? truckType = null,
    Object? status = null,
    Object? assignedDriverId = freezed,
    Object? createdAt = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      workshopLocation: null == workshopLocation
          ? _value.workshopLocation
          : workshopLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      truckType: null == truckType
          ? _value.truckType
          : truckType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedDriverId: freezed == assignedDriverId
          ? _value.assignedDriverId
          : assignedDriverId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @GeoPointConverter() GeoPoint pickupLocation,
      @GeoPointConverter() GeoPoint workshopLocation,
      String truckType,
      String status,
      String? assignedDriverId,
      DateTime createdAt,
      double price});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pickupLocation = null,
    Object? workshopLocation = null,
    Object? truckType = null,
    Object? status = null,
    Object? assignedDriverId = freezed,
    Object? createdAt = null,
    Object? price = null,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pickupLocation: null == pickupLocation
          ? _value.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      workshopLocation: null == workshopLocation
          ? _value.workshopLocation
          : workshopLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      truckType: null == truckType
          ? _value.truckType
          : truckType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      assignedDriverId: freezed == assignedDriverId
          ? _value.assignedDriverId
          : assignedDriverId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      @GeoPointConverter() required this.pickupLocation,
      @GeoPointConverter() required this.workshopLocation,
      required this.truckType,
      required this.status,
      this.assignedDriverId,
      required this.createdAt,
      required this.price});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  @GeoPointConverter()
  final GeoPoint pickupLocation;
  @override
  @GeoPointConverter()
  final GeoPoint workshopLocation;
  @override
  final String truckType;
  @override
  final String status;
  @override
  final String? assignedDriverId;
  @override
  final DateTime createdAt;
  @override
  final double price;

  @override
  String toString() {
    return 'OrderModel(id: $id, pickupLocation: $pickupLocation, workshopLocation: $workshopLocation, truckType: $truckType, status: $status, assignedDriverId: $assignedDriverId, createdAt: $createdAt, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.workshopLocation, workshopLocation) ||
                other.workshopLocation == workshopLocation) &&
            (identical(other.truckType, truckType) ||
                other.truckType == truckType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedDriverId, assignedDriverId) ||
                other.assignedDriverId == assignedDriverId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pickupLocation,
      workshopLocation, truckType, status, assignedDriverId, createdAt, price);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final String id,
      @GeoPointConverter() required final GeoPoint pickupLocation,
      @GeoPointConverter() required final GeoPoint workshopLocation,
      required final String truckType,
      required final String status,
      final String? assignedDriverId,
      required final DateTime createdAt,
      required final double price}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  @GeoPointConverter()
  GeoPoint get pickupLocation;
  @override
  @GeoPointConverter()
  GeoPoint get workshopLocation;
  @override
  String get truckType;
  @override
  String get status;
  @override
  String? get assignedDriverId;
  @override
  DateTime get createdAt;
  @override
  double get price;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
