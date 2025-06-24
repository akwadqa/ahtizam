// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passenger_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PassengerDetails _$PassengerDetailsFromJson(Map<String, dynamic> json) {
  return _PassengerDetails.fromJson(json);
}

/// @nodoc
mixin _$PassengerDetails {
  String get passenger => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String get driverPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;

  /// Serializes this PassengerDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PassengerDetailsCopyWith<PassengerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerDetailsCopyWith<$Res> {
  factory $PassengerDetailsCopyWith(
          PassengerDetails value, $Res Function(PassengerDetails) then) =
      _$PassengerDetailsCopyWithImpl<$Res, PassengerDetails>;
  @useResult
  $Res call(
      {String passenger,
      @JsonKey(name: "full_name") String fullName,
      @JsonKey(name: "phone") String driverPhone,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class _$PassengerDetailsCopyWithImpl<$Res, $Val extends PassengerDetails>
    implements $PassengerDetailsCopyWith<$Res> {
  _$PassengerDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passenger = null,
    Object? fullName = null,
    Object? driverPhone = null,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      passenger: null == passenger
          ? _value.passenger
          : passenger // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PassengerDetailsImplCopyWith<$Res>
    implements $PassengerDetailsCopyWith<$Res> {
  factory _$$PassengerDetailsImplCopyWith(_$PassengerDetailsImpl value,
          $Res Function(_$PassengerDetailsImpl) then) =
      __$$PassengerDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String passenger,
      @JsonKey(name: "full_name") String fullName,
      @JsonKey(name: "phone") String driverPhone,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class __$$PassengerDetailsImplCopyWithImpl<$Res>
    extends _$PassengerDetailsCopyWithImpl<$Res, _$PassengerDetailsImpl>
    implements _$$PassengerDetailsImplCopyWith<$Res> {
  __$$PassengerDetailsImplCopyWithImpl(_$PassengerDetailsImpl _value,
      $Res Function(_$PassengerDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passenger = null,
    Object? fullName = null,
    Object? driverPhone = null,
    Object? profileImage = freezed,
  }) {
    return _then(_$PassengerDetailsImpl(
      passenger: null == passenger
          ? _value.passenger
          : passenger // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PassengerDetailsImpl implements _PassengerDetails {
  const _$PassengerDetailsImpl(
      {required this.passenger,
      @JsonKey(name: "full_name") required this.fullName,
      @JsonKey(name: "phone") required this.driverPhone,
      @JsonKey(name: "profile_image") this.profileImage});

  factory _$PassengerDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PassengerDetailsImplFromJson(json);

  @override
  final String passenger;
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
  String toString() {
    return 'PassengerDetails(passenger: $passenger, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassengerDetailsImpl &&
            (identical(other.passenger, passenger) ||
                other.passenger == passenger) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, passenger, fullName, driverPhone, profileImage);

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PassengerDetailsImplCopyWith<_$PassengerDetailsImpl> get copyWith =>
      __$$PassengerDetailsImplCopyWithImpl<_$PassengerDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PassengerDetailsImplToJson(
      this,
    );
  }
}

abstract class _PassengerDetails implements PassengerDetails {
  const factory _PassengerDetails(
          {required final String passenger,
          @JsonKey(name: "full_name") required final String fullName,
          @JsonKey(name: "phone") required final String driverPhone,
          @JsonKey(name: "profile_image") final String? profileImage}) =
      _$PassengerDetailsImpl;

  factory _PassengerDetails.fromJson(Map<String, dynamic> json) =
      _$PassengerDetailsImpl.fromJson;

  @override
  String get passenger;
  @override
  @JsonKey(name: "full_name")
  String get fullName;
  @override
  @JsonKey(name: "phone")
  String get driverPhone;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;

  /// Create a copy of PassengerDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PassengerDetailsImplCopyWith<_$PassengerDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
