// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) {
  return _UserInformation.fromJson(json);
}

/// @nodoc
mixin _$UserInformation {
  @HiveField(0)
  String get ***REMOVED*** => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "full_name")
  String get fullName => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "mobile_no")
  String get mobileNumber => throw _privateConstructorUsedError;

  /// Serializes this UserInformation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInformationCopyWith<UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationCopyWith<$Res> {
  factory $UserInformationCopyWith(
          UserInformation value, $Res Function(UserInformation) then) =
      _$UserInformationCopyWithImpl<$Res, UserInformation>;
  @useResult
  $Res call(
      {@HiveField(0) String ***REMOVED***,
      @HiveField(1) @JsonKey(name: "full_name") String fullName,
      @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber});
}

/// @nodoc
class _$UserInformationCopyWithImpl<$Res, $Val extends UserInformation>
    implements $UserInformationCopyWith<$Res> {
  _$UserInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ***REMOVED*** = null,
    Object? fullName = null,
    Object? mobileNumber = null,
  }) {
    return _then(_value.copyWith(
      ***REMOVED***: null == ***REMOVED***
          ? _value.***REMOVED***
          : ***REMOVED*** // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInformationImplCopyWith<$Res>
    implements $UserInformationCopyWith<$Res> {
  factory _$$UserInformationImplCopyWith(_$UserInformationImpl value,
          $Res Function(_$UserInformationImpl) then) =
      __$$UserInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String ***REMOVED***,
      @HiveField(1) @JsonKey(name: "full_name") String fullName,
      @HiveField(2) @JsonKey(name: "mobile_no") String mobileNumber});
}

/// @nodoc
class __$$UserInformationImplCopyWithImpl<$Res>
    extends _$UserInformationCopyWithImpl<$Res, _$UserInformationImpl>
    implements _$$UserInformationImplCopyWith<$Res> {
  __$$UserInformationImplCopyWithImpl(
      _$UserInformationImpl _value, $Res Function(_$UserInformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ***REMOVED*** = null,
    Object? fullName = null,
    Object? mobileNumber = null,
  }) {
    return _then(_$UserInformationImpl(
      ***REMOVED***: null == ***REMOVED***
          ? _value.***REMOVED***
          : ***REMOVED*** // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInformationImpl implements _UserInformation {
  _$UserInformationImpl(
      {@HiveField(0) required this.***REMOVED***,
      @HiveField(1) @JsonKey(name: "full_name") required this.fullName,
      @HiveField(2) @JsonKey(name: "mobile_no") required this.mobileNumber});

  factory _$UserInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInformationImplFromJson(json);

  @override
  @HiveField(0)
  final String ***REMOVED***;
  @override
  @HiveField(1)
  @JsonKey(name: "full_name")
  final String fullName;
  @override
  @HiveField(2)
  @JsonKey(name: "mobile_no")
  final String mobileNumber;

  @override
  String toString() {
    return 'UserInformation(***REMOVED***: $***REMOVED***, fullName: $fullName, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInformationImpl &&
            (identical(other.***REMOVED***, ***REMOVED***) || other.***REMOVED*** == ***REMOVED***) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ***REMOVED***, fullName, mobileNumber);

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInformationImplCopyWith<_$UserInformationImpl> get copyWith =>
      __$$UserInformationImplCopyWithImpl<_$UserInformationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInformationImplToJson(
      this,
    );
  }
}

abstract class _UserInformation implements UserInformation {
  factory _UserInformation(
      {@HiveField(0) required final String ***REMOVED***,
      @HiveField(1) @JsonKey(name: "full_name") required final String fullName,
      @HiveField(2)
      @JsonKey(name: "mobile_no")
      required final String mobileNumber}) = _$UserInformationImpl;

  factory _UserInformation.fromJson(Map<String, dynamic> json) =
      _$UserInformationImpl.fromJson;

  @override
  @HiveField(0)
  String get ***REMOVED***;
  @override
  @HiveField(1)
  @JsonKey(name: "full_name")
  String get fullName;
  @override
  @HiveField(2)
  @JsonKey(name: "mobile_no")
  String get mobileNumber;

  /// Create a copy of UserInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInformationImplCopyWith<_$UserInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
