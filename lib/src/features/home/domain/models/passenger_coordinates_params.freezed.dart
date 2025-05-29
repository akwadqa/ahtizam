// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_coordinates_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PassengerCoordinatesParams _$PassengerCoordinatesParamsFromJson(
    Map<String, dynamic> json) {
  return _PassengerCoordinatesParams.fromJson(json);
}

/// @nodoc
mixin _$PassengerCoordinatesParams {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this PassengerCoordinatesParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PassengerCoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PassengerCoordinatesParamsCopyWith<PassengerCoordinatesParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerCoordinatesParamsCopyWith<$Res> {
  factory $PassengerCoordinatesParamsCopyWith(PassengerCoordinatesParams value,
          $Res Function(PassengerCoordinatesParams) then) =
      _$PassengerCoordinatesParamsCopyWithImpl<$Res,
          PassengerCoordinatesParams>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$PassengerCoordinatesParamsCopyWithImpl<$Res,
        $Val extends PassengerCoordinatesParams>
    implements $PassengerCoordinatesParamsCopyWith<$Res> {
  _$PassengerCoordinatesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PassengerCoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassengerCoordinatesParamsImplCopyWith<$Res>
    implements $PassengerCoordinatesParamsCopyWith<$Res> {
  factory _$$PassengerCoordinatesParamsImplCopyWith(
          _$PassengerCoordinatesParamsImpl value,
          $Res Function(_$PassengerCoordinatesParamsImpl) then) =
      __$$PassengerCoordinatesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$PassengerCoordinatesParamsImplCopyWithImpl<$Res>
    extends _$PassengerCoordinatesParamsCopyWithImpl<$Res,
        _$PassengerCoordinatesParamsImpl>
    implements _$$PassengerCoordinatesParamsImplCopyWith<$Res> {
  __$$PassengerCoordinatesParamsImplCopyWithImpl(
      _$PassengerCoordinatesParamsImpl _value,
      $Res Function(_$PassengerCoordinatesParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PassengerCoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$PassengerCoordinatesParamsImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassengerCoordinatesParamsImpl implements _PassengerCoordinatesParams {
  const _$PassengerCoordinatesParamsImpl(
      {required this.lat, required this.lng});

  factory _$PassengerCoordinatesParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PassengerCoordinatesParamsImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'PassengerCoordinatesParams(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerCoordinatesParamsImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of PassengerCoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerCoordinatesParamsImplCopyWith<_$PassengerCoordinatesParamsImpl>
      get copyWith => __$$PassengerCoordinatesParamsImplCopyWithImpl<
          _$PassengerCoordinatesParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerCoordinatesParamsImplToJson(
      this,
    );
  }
}

abstract class _PassengerCoordinatesParams
    implements PassengerCoordinatesParams {
  const factory _PassengerCoordinatesParams(
      {required final double lat,
      required final double lng}) = _$PassengerCoordinatesParamsImpl;

  factory _PassengerCoordinatesParams.fromJson(Map<String, dynamic> json) =
      _$PassengerCoordinatesParamsImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of PassengerCoordinatesParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PassengerCoordinatesParamsImplCopyWith<_$PassengerCoordinatesParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
