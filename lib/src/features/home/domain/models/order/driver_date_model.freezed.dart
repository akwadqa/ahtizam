// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_date_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverDateModel _$DriverDateModelFromJson(Map<String, dynamic> json) {
  return _DriverDateModel.fromJson(json);
}

/// @nodoc
mixin _$DriverDateModel {
  @JsonKey(name: "driver_id")
  String? get driverId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; //     required String name,
//     required String image,
//     required String phone,
//  @JsonKey(name: "truck_number")   required String truckNumber,
//   @JsonKey(name: "otp_number")  required String otpNumber,
//     required double rate,
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this DriverDateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverDateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverDateModelCopyWith<DriverDateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDateModelCopyWith<$Res> {
  factory $DriverDateModelCopyWith(
          DriverDateModel value, $Res Function(DriverDateModel) then) =
      _$DriverDateModelCopyWithImpl<$Res, DriverDateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "driver_id") String? driverId,
      String status,
      double lat,
      double lng});
}

/// @nodoc
class _$DriverDateModelCopyWithImpl<$Res, $Val extends DriverDateModel>
    implements $DriverDateModelCopyWith<$Res> {
  _$DriverDateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverDateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = freezed,
    Object? status = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$DriverDateModelImplCopyWith<$Res>
    implements $DriverDateModelCopyWith<$Res> {
  factory _$$DriverDateModelImplCopyWith(_$DriverDateModelImpl value,
          $Res Function(_$DriverDateModelImpl) then) =
      __$$DriverDateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "driver_id") String? driverId,
      String status,
      double lat,
      double lng});
}

/// @nodoc
class __$$DriverDateModelImplCopyWithImpl<$Res>
    extends _$DriverDateModelCopyWithImpl<$Res, _$DriverDateModelImpl>
    implements _$$DriverDateModelImplCopyWith<$Res> {
  __$$DriverDateModelImplCopyWithImpl(
      _$DriverDateModelImpl _value, $Res Function(_$DriverDateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverDateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = freezed,
    Object? status = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$DriverDateModelImpl(
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$DriverDateModelImpl implements _DriverDateModel {
  _$DriverDateModelImpl(
      {@JsonKey(name: "driver_id") required this.driverId,
      required this.status,
      required this.lat,
      required this.lng});

  factory _$DriverDateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDateModelImplFromJson(json);

  @override
  @JsonKey(name: "driver_id")
  final String? driverId;
  @override
  final String status;
//     required String name,
//     required String image,
//     required String phone,
//  @JsonKey(name: "truck_number")   required String truckNumber,
//   @JsonKey(name: "otp_number")  required String otpNumber,
//     required double rate,
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'DriverDateModel(driverId: $driverId, status: $status, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDateModelImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, driverId, status, lat, lng);

  /// Create a copy of DriverDateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDateModelImplCopyWith<_$DriverDateModelImpl> get copyWith =>
      __$$DriverDateModelImplCopyWithImpl<_$DriverDateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDateModelImplToJson(
      this,
    );
  }
}

abstract class _DriverDateModel implements DriverDateModel {
  factory _DriverDateModel(
      {@JsonKey(name: "driver_id") required final String? driverId,
      required final String status,
      required final double lat,
      required final double lng}) = _$DriverDateModelImpl;

  factory _DriverDateModel.fromJson(Map<String, dynamic> json) =
      _$DriverDateModelImpl.fromJson;

  @override
  @JsonKey(name: "driver_id")
  String? get driverId;
  @override
  String get status; //     required String name,
//     required String image,
//     required String phone,
//  @JsonKey(name: "truck_number")   required String truckNumber,
//   @JsonKey(name: "otp_number")  required String otpNumber,
//     required double rate,
  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of DriverDateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverDateModelImplCopyWith<_$DriverDateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
