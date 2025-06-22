// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLocationModel _$OrderLocationModelFromJson(Map<String, dynamic> json) {
  return _OrderLocationModel.fromJson(json);
}

/// @nodoc
mixin _$OrderLocationModel {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this OrderLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLocationModelCopyWith<OrderLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLocationModelCopyWith<$Res> {
  factory $OrderLocationModelCopyWith(
          OrderLocationModel value, $Res Function(OrderLocationModel) then) =
      _$OrderLocationModelCopyWithImpl<$Res, OrderLocationModel>;
  @useResult
  $Res call({double latitude, double longitude, String address});
}

/// @nodoc
class _$OrderLocationModelCopyWithImpl<$Res, $Val extends OrderLocationModel>
    implements $OrderLocationModelCopyWith<$Res> {
  _$OrderLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderLocationModelImplCopyWith<$Res>
    implements $OrderLocationModelCopyWith<$Res> {
  factory _$$OrderLocationModelImplCopyWith(_$OrderLocationModelImpl value,
          $Res Function(_$OrderLocationModelImpl) then) =
      __$$OrderLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, String address});
}

/// @nodoc
class __$$OrderLocationModelImplCopyWithImpl<$Res>
    extends _$OrderLocationModelCopyWithImpl<$Res, _$OrderLocationModelImpl>
    implements _$$OrderLocationModelImplCopyWith<$Res> {
  __$$OrderLocationModelImplCopyWithImpl(_$OrderLocationModelImpl _value,
      $Res Function(_$OrderLocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
  }) {
    return _then(_$OrderLocationModelImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLocationModelImpl implements _OrderLocationModel {
  const _$OrderLocationModelImpl(
      {required this.latitude, required this.longitude, required this.address});

  factory _$OrderLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLocationModelImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String address;

  @override
  String toString() {
    return 'OrderLocationModel(latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLocationModelImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address);

  /// Create a copy of OrderLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLocationModelImplCopyWith<_$OrderLocationModelImpl> get copyWith =>
      __$$OrderLocationModelImplCopyWithImpl<_$OrderLocationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLocationModelImplToJson(
      this,
    );
  }
}

abstract class _OrderLocationModel implements OrderLocationModel {
  const factory _OrderLocationModel(
      {required final double latitude,
      required final double longitude,
      required final String address}) = _$OrderLocationModelImpl;

  factory _OrderLocationModel.fromJson(Map<String, dynamic> json) =
      _$OrderLocationModelImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get address;

  /// Create a copy of OrderLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLocationModelImplCopyWith<_$OrderLocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
