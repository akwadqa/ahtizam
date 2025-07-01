// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverDetails _$DriverDetailsFromJson(Map<String, dynamic> json) {
  return _DriverDetails.fromJson(json);
}

/// @nodoc
mixin _$DriverDetails {
  @JsonKey(name: "assigned_date")
  DateTime get assignedDate => throw _privateConstructorUsedError;
  @JsonKey(name: "assigned_time")
  String get assignedTime => throw _privateConstructorUsedError;
  @JsonKey(name: "assigned_driver")
  String get assignedDriver => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String get driverPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;

  /// Serializes this DriverDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverDetailsCopyWith<DriverDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDetailsCopyWith<$Res> {
  factory $DriverDetailsCopyWith(
          DriverDetails value, $Res Function(DriverDetails) then) =
      _$DriverDetailsCopyWithImpl<$Res, DriverDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "assigned_date") DateTime assignedDate,
      @JsonKey(name: "assigned_time") String assignedTime,
      @JsonKey(name: "assigned_driver") String assignedDriver,
      @JsonKey(name: "full_name") String fullName,
      @JsonKey(name: "phone") String driverPhone,
      @JsonKey(name: "profile_image") String? profileImage,
      int? rating});
}

/// @nodoc
class _$DriverDetailsCopyWithImpl<$Res, $Val extends DriverDetails>
    implements $DriverDetailsCopyWith<$Res> {
  _$DriverDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedDate = null,
    Object? assignedTime = null,
    Object? assignedDriver = null,
    Object? fullName = null,
    Object? driverPhone = null,
    Object? profileImage = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      assignedDate: null == assignedDate
          ? _value.assignedDate
          : assignedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedTime: null == assignedTime
          ? _value.assignedTime
          : assignedTime // ignore: cast_nullable_to_non_nullable
              as String,
      assignedDriver: null == assignedDriver
          ? _value.assignedDriver
          : assignedDriver // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      driverPhone: null == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverDetailsImplCopyWith<$Res>
    implements $DriverDetailsCopyWith<$Res> {
  factory _$$DriverDetailsImplCopyWith(
          _$DriverDetailsImpl value, $Res Function(_$DriverDetailsImpl) then) =
      __$$DriverDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "assigned_date") DateTime assignedDate,
      @JsonKey(name: "assigned_time") String assignedTime,
      @JsonKey(name: "assigned_driver") String assignedDriver,
      @JsonKey(name: "full_name") String fullName,
      @JsonKey(name: "phone") String driverPhone,
      @JsonKey(name: "profile_image") String? profileImage,
      int? rating});
}

/// @nodoc
class __$$DriverDetailsImplCopyWithImpl<$Res>
    extends _$DriverDetailsCopyWithImpl<$Res, _$DriverDetailsImpl>
    implements _$$DriverDetailsImplCopyWith<$Res> {
  __$$DriverDetailsImplCopyWithImpl(
      _$DriverDetailsImpl _value, $Res Function(_$DriverDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignedDate = null,
    Object? assignedTime = null,
    Object? assignedDriver = null,
    Object? fullName = null,
    Object? driverPhone = null,
    Object? profileImage = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$DriverDetailsImpl(
      assignedDate: null == assignedDate
          ? _value.assignedDate
          : assignedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedTime: null == assignedTime
          ? _value.assignedTime
          : assignedTime // ignore: cast_nullable_to_non_nullable
              as String,
      assignedDriver: null == assignedDriver
          ? _value.assignedDriver
          : assignedDriver // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      driverPhone: null == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDetailsImpl implements _DriverDetails {
  const _$DriverDetailsImpl(
      {@JsonKey(name: "assigned_date") required this.assignedDate,
      @JsonKey(name: "assigned_time") required this.assignedTime,
      @JsonKey(name: "assigned_driver") required this.assignedDriver,
      @JsonKey(name: "full_name") required this.fullName,
      @JsonKey(name: "phone") required this.driverPhone,
      @JsonKey(name: "profile_image") this.profileImage,
      required this.rating});

  factory _$DriverDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDetailsImplFromJson(json);

  @override
  @JsonKey(name: "assigned_date")
  final DateTime assignedDate;
  @override
  @JsonKey(name: "assigned_time")
  final String assignedTime;
  @override
  @JsonKey(name: "assigned_driver")
  final String assignedDriver;
  @override
  @JsonKey(name: "full_name")
  final String fullName;
  @override
  @JsonKey(name: "phone")
  final String driverPhone;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  final int? rating;

  @override
  String toString() {
    return 'DriverDetails(assignedDate: $assignedDate, assignedTime: $assignedTime, assignedDriver: $assignedDriver, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDetailsImpl &&
            (identical(other.assignedDate, assignedDate) ||
                other.assignedDate == assignedDate) &&
            (identical(other.assignedTime, assignedTime) ||
                other.assignedTime == assignedTime) &&
            (identical(other.assignedDriver, assignedDriver) ||
                other.assignedDriver == assignedDriver) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, assignedDate, assignedTime,
      assignedDriver, fullName, driverPhone, profileImage, rating);

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      __$$DriverDetailsImplCopyWithImpl<_$DriverDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDetailsImplToJson(
      this,
    );
  }
}

abstract class _DriverDetails implements DriverDetails {
  const factory _DriverDetails(
      {@JsonKey(name: "assigned_date") required final DateTime assignedDate,
      @JsonKey(name: "assigned_time") required final String assignedTime,
      @JsonKey(name: "assigned_driver") required final String assignedDriver,
      @JsonKey(name: "full_name") required final String fullName,
      @JsonKey(name: "phone") required final String driverPhone,
      @JsonKey(name: "profile_image") final String? profileImage,
      required final int? rating}) = _$DriverDetailsImpl;

  factory _DriverDetails.fromJson(Map<String, dynamic> json) =
      _$DriverDetailsImpl.fromJson;

  @override
  @JsonKey(name: "assigned_date")
  DateTime get assignedDate;
  @override
  @JsonKey(name: "assigned_time")
  String get assignedTime;
  @override
  @JsonKey(name: "assigned_driver")
  String get assignedDriver;
  @override
  @JsonKey(name: "full_name")
  String get fullName;
  @override
  @JsonKey(name: "phone")
  String get driverPhone;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  int? get rating;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
