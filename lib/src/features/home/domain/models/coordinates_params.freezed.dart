// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinates_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoordinatesParams _$CoordinatesParamsFromJson(Map<String, dynamic> json) {
  return _CoordinatesParams.fromJson(json);
}

/// @nodoc
mixin _$CoordinatesParams {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this CoordinatesParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinatesParamsCopyWith<CoordinatesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesParamsCopyWith<$Res> {
  factory $CoordinatesParamsCopyWith(
          CoordinatesParams value, $Res Function(CoordinatesParams) then) =
      _$CoordinatesParamsCopyWithImpl<$Res, CoordinatesParams>;
  @useResult
  $Res call({double lat, double lng, String address});
}

/// @nodoc
class _$CoordinatesParamsCopyWithImpl<$Res, $Val extends CoordinatesParams>
    implements $CoordinatesParamsCopyWith<$Res> {
  _$CoordinatesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinatesParamsImplCopyWith<$Res>
    implements $CoordinatesParamsCopyWith<$Res> {
  factory _$$CoordinatesParamsImplCopyWith(_$CoordinatesParamsImpl value,
          $Res Function(_$CoordinatesParamsImpl) then) =
      __$$CoordinatesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng, String address});
}

/// @nodoc
class __$$CoordinatesParamsImplCopyWithImpl<$Res>
    extends _$CoordinatesParamsCopyWithImpl<$Res, _$CoordinatesParamsImpl>
    implements _$$CoordinatesParamsImplCopyWith<$Res> {
  __$$CoordinatesParamsImplCopyWithImpl(_$CoordinatesParamsImpl _value,
      $Res Function(_$CoordinatesParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? address = null,
  }) {
    return _then(_$CoordinatesParamsImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
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
class _$CoordinatesParamsImpl implements _CoordinatesParams {
  const _$CoordinatesParamsImpl(
      {required this.lat, required this.lng, required this.address});

  factory _$CoordinatesParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinatesParamsImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String address;

  @override
  String toString() {
    return 'CoordinatesParams(lat: $lat, lng: $lng, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinatesParamsImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, address);

  /// Create a copy of CoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinatesParamsImplCopyWith<_$CoordinatesParamsImpl> get copyWith =>
      __$$CoordinatesParamsImplCopyWithImpl<_$CoordinatesParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinatesParamsImplToJson(
      this,
    );
  }
}

abstract class _CoordinatesParams implements CoordinatesParams {
  const factory _CoordinatesParams(
      {required final double lat,
      required final double lng,
      required final String address}) = _$CoordinatesParamsImpl;

  factory _CoordinatesParams.fromJson(Map<String, dynamic> json) =
      _$CoordinatesParamsImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String get address;

  /// Create a copy of CoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinatesParamsImplCopyWith<_$CoordinatesParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
