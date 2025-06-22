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
  String get status => throw _privateConstructorUsedError;
  int get available => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_number")
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_type")
  String get vehicleType =>
      throw _privateConstructorUsedError; //   @JsonKey(name: "otp_number")  required String otpNumber,
  @JsonKey(name: "driver_rate")
  double get rate => throw _privateConstructorUsedError;
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
      int available,
      @JsonKey(name: "driver_name") String name,
      @JsonKey(name: "driver_image") String? image,
      @JsonKey(name: "driver_number") String phone,
      @JsonKey(name: "vehicle_type") String vehicleType,
      @JsonKey(name: "driver_rate") double rate,
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
    Object? available = null,
    Object? name = null,
    Object? image = freezed,
    Object? phone = null,
    Object? vehicleType = null,
    Object? rate = null,
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
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
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
      int available,
      @JsonKey(name: "driver_name") String name,
      @JsonKey(name: "driver_image") String? image,
      @JsonKey(name: "driver_number") String phone,
      @JsonKey(name: "vehicle_type") String vehicleType,
      @JsonKey(name: "driver_rate") double rate,
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
    Object? available = null,
    Object? name = null,
    Object? image = freezed,
    Object? phone = null,
    Object? vehicleType = null,
    Object? rate = null,
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
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
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
      required this.available,
      @JsonKey(name: "driver_name") required this.name,
      @JsonKey(name: "driver_image") this.image,
      @JsonKey(name: "driver_number") required this.phone,
      @JsonKey(name: "vehicle_type") required this.vehicleType,
      @JsonKey(name: "driver_rate") required this.rate,
      required this.lat,
      required this.lng});

  factory _$DriverDateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDateModelImplFromJson(json);

  @override
  @JsonKey(name: "driver_id")
  final String? driverId;
  @override
  final String status;
  @override
  final int available;
  @override
  @JsonKey(name: "driver_name")
  final String name;
  @override
  @JsonKey(name: "driver_image")
  final String? image;
  @override
  @JsonKey(name: "driver_number")
  final String phone;
  @override
  @JsonKey(name: "vehicle_type")
  final String vehicleType;
//   @JsonKey(name: "otp_number")  required String otpNumber,
  @override
  @JsonKey(name: "driver_rate")
  final double rate;
  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'DriverDateModel(driverId: $driverId, status: $status, available: $available, name: $name, image: $image, phone: $phone, vehicleType: $vehicleType, rate: $rate, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDateModelImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, driverId, status, available,
      name, image, phone, vehicleType, rate, lat, lng);

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
      required final int available,
      @JsonKey(name: "driver_name") required final String name,
      @JsonKey(name: "driver_image") final String? image,
      @JsonKey(name: "driver_number") required final String phone,
      @JsonKey(name: "vehicle_type") required final String vehicleType,
      @JsonKey(name: "driver_rate") required final double rate,
      required final double lat,
      required final double lng}) = _$DriverDateModelImpl;

  factory _DriverDateModel.fromJson(Map<String, dynamic> json) =
      _$DriverDateModelImpl.fromJson;

  @override
  @JsonKey(name: "driver_id")
  String? get driverId;
  @override
  String get status;
  @override
  int get available;
  @override
  @JsonKey(name: "driver_name")
  String get name;
  @override
  @JsonKey(name: "driver_image")
  String? get image;
  @override
  @JsonKey(name: "driver_number")
  String get phone;
  @override
  @JsonKey(name: "vehicle_type")
  String
      get vehicleType; //   @JsonKey(name: "otp_number")  required String otpNumber,
  @override
  @JsonKey(name: "driver_rate")
  double get rate;
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
