// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverInfoModel _$DriverInfoModelFromJson(Map<String, dynamic> json) {
  return _DriverInfoModel.fromJson(json);
}

/// @nodoc
mixin _$DriverInfoModel {
  @JsonKey(name: "service_type")
  String get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: "qid")
  int get qid => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "mobile_no")
  String get driverPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  /// Serializes this DriverInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverInfoModelCopyWith<DriverInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverInfoModelCopyWith<$Res> {
  factory $DriverInfoModelCopyWith(
          DriverInfoModel value, $Res Function(DriverInfoModel) then) =
      _$DriverInfoModelCopyWithImpl<$Res, DriverInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "service_type") String serviceType,
      @JsonKey(name: "qid") int qid,
      @JsonKey(name: "full_name") String fullName,
      @JsonKey(name: "mobile_no") String driverPhone,
      @JsonKey(name: "profile_image") String? profileImage,
      double? rating});
}

/// @nodoc
class _$DriverInfoModelCopyWithImpl<$Res, $Val extends DriverInfoModel>
    implements $DriverInfoModelCopyWith<$Res> {
  _$DriverInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceType = null,
    Object? qid = null,
    Object? fullName = null,
    Object? driverPhone = null,
    Object? profileImage = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      qid: null == qid
          ? _value.qid
          : qid // ignore: cast_nullable_to_non_nullable
              as int,
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
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverInfoModelImplCopyWith<$Res>
    implements $DriverInfoModelCopyWith<$Res> {
  factory _$$DriverInfoModelImplCopyWith(_$DriverInfoModelImpl value,
          $Res Function(_$DriverInfoModelImpl) then) =
      __$$DriverInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "service_type") String serviceType,
      @JsonKey(name: "qid") int qid,
      @JsonKey(name: "full_name") String fullName,
      @JsonKey(name: "mobile_no") String driverPhone,
      @JsonKey(name: "profile_image") String? profileImage,
      double? rating});
}

/// @nodoc
class __$$DriverInfoModelImplCopyWithImpl<$Res>
    extends _$DriverInfoModelCopyWithImpl<$Res, _$DriverInfoModelImpl>
    implements _$$DriverInfoModelImplCopyWith<$Res> {
  __$$DriverInfoModelImplCopyWithImpl(
      _$DriverInfoModelImpl _value, $Res Function(_$DriverInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceType = null,
    Object? qid = null,
    Object? fullName = null,
    Object? driverPhone = null,
    Object? profileImage = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$DriverInfoModelImpl(
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      qid: null == qid
          ? _value.qid
          : qid // ignore: cast_nullable_to_non_nullable
              as int,
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
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverInfoModelImpl implements _DriverInfoModel {
  const _$DriverInfoModelImpl(
      {@JsonKey(name: "service_type") required this.serviceType,
      @JsonKey(name: "qid") required this.qid,
      @JsonKey(name: "full_name") required this.fullName,
      @JsonKey(name: "mobile_no") required this.driverPhone,
      @JsonKey(name: "profile_image") this.profileImage,
      required this.rating});

  factory _$DriverInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "service_type")
  final String serviceType;
  @override
  @JsonKey(name: "qid")
  final int qid;
  @override
  @JsonKey(name: "full_name")
  final String fullName;
  @override
  @JsonKey(name: "mobile_no")
  final String driverPhone;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  final double? rating;

  @override
  String toString() {
    return 'DriverInfoModel(serviceType: $serviceType, qid: $qid, fullName: $fullName, driverPhone: $driverPhone, profileImage: $profileImage, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverInfoModelImpl &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.qid, qid) || other.qid == qid) &&
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
  int get hashCode => Object.hash(runtimeType, serviceType, qid, fullName,
      driverPhone, profileImage, rating);

  /// Create a copy of DriverInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverInfoModelImplCopyWith<_$DriverInfoModelImpl> get copyWith =>
      __$$DriverInfoModelImplCopyWithImpl<_$DriverInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverInfoModelImplToJson(
      this,
    );
  }
}

abstract class _DriverInfoModel implements DriverInfoModel {
  const factory _DriverInfoModel(
      {@JsonKey(name: "service_type") required final String serviceType,
      @JsonKey(name: "qid") required final int qid,
      @JsonKey(name: "full_name") required final String fullName,
      @JsonKey(name: "mobile_no") required final String driverPhone,
      @JsonKey(name: "profile_image") final String? profileImage,
      required final double? rating}) = _$DriverInfoModelImpl;

  factory _DriverInfoModel.fromJson(Map<String, dynamic> json) =
      _$DriverInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "service_type")
  String get serviceType;
  @override
  @JsonKey(name: "qid")
  int get qid;
  @override
  @JsonKey(name: "full_name")
  String get fullName;
  @override
  @JsonKey(name: "mobile_no")
  String get driverPhone;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  double? get rating;

  /// Create a copy of DriverInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverInfoModelImplCopyWith<_$DriverInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
