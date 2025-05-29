// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_order_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuickOrderDetailsModel _$QuickOrderDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _QuickOrderDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$QuickOrderDetailsModel {
  @JsonKey(name: "order_status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "driver_data")
  DriverDateModel? get driverData => throw _privateConstructorUsedError;

  /// Serializes this QuickOrderDetailsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuickOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickOrderDetailsModelCopyWith<QuickOrderDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickOrderDetailsModelCopyWith<$Res> {
  factory $QuickOrderDetailsModelCopyWith(QuickOrderDetailsModel value,
          $Res Function(QuickOrderDetailsModel) then) =
      _$QuickOrderDetailsModelCopyWithImpl<$Res, QuickOrderDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "order_status") String status,
      @JsonKey(name: "driver_data") DriverDateModel? driverData});

  $DriverDateModelCopyWith<$Res>? get driverData;
}

/// @nodoc
class _$QuickOrderDetailsModelCopyWithImpl<$Res,
        $Val extends QuickOrderDetailsModel>
    implements $QuickOrderDetailsModelCopyWith<$Res> {
  _$QuickOrderDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? driverData = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      driverData: freezed == driverData
          ? _value.driverData
          : driverData // ignore: cast_nullable_to_non_nullable
              as DriverDateModel?,
    ) as $Val);
  }

  /// Create a copy of QuickOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverDateModelCopyWith<$Res>? get driverData {
    if (_value.driverData == null) {
      return null;
    }

    return $DriverDateModelCopyWith<$Res>(_value.driverData!, (value) {
      return _then(_value.copyWith(driverData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuickOrderDetailsModelImplCopyWith<$Res>
    implements $QuickOrderDetailsModelCopyWith<$Res> {
  factory _$$QuickOrderDetailsModelImplCopyWith(
          _$QuickOrderDetailsModelImpl value,
          $Res Function(_$QuickOrderDetailsModelImpl) then) =
      __$$QuickOrderDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "order_status") String status,
      @JsonKey(name: "driver_data") DriverDateModel? driverData});

  @override
  $DriverDateModelCopyWith<$Res>? get driverData;
}

/// @nodoc
class __$$QuickOrderDetailsModelImplCopyWithImpl<$Res>
    extends _$QuickOrderDetailsModelCopyWithImpl<$Res,
        _$QuickOrderDetailsModelImpl>
    implements _$$QuickOrderDetailsModelImplCopyWith<$Res> {
  __$$QuickOrderDetailsModelImplCopyWithImpl(
      _$QuickOrderDetailsModelImpl _value,
      $Res Function(_$QuickOrderDetailsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuickOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? driverData = freezed,
  }) {
    return _then(_$QuickOrderDetailsModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      driverData: freezed == driverData
          ? _value.driverData
          : driverData // ignore: cast_nullable_to_non_nullable
              as DriverDateModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickOrderDetailsModelImpl implements _QuickOrderDetailsModel {
  const _$QuickOrderDetailsModelImpl(
      {@JsonKey(name: "order_status") required this.status,
      @JsonKey(name: "driver_data") required this.driverData});

  factory _$QuickOrderDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickOrderDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: "order_status")
  final String status;
  @override
  @JsonKey(name: "driver_data")
  final DriverDateModel? driverData;

  @override
  String toString() {
    return 'QuickOrderDetailsModel(status: $status, driverData: $driverData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickOrderDetailsModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.driverData, driverData) ||
                other.driverData == driverData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, driverData);

  /// Create a copy of QuickOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickOrderDetailsModelImplCopyWith<_$QuickOrderDetailsModelImpl>
      get copyWith => __$$QuickOrderDetailsModelImplCopyWithImpl<
          _$QuickOrderDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickOrderDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _QuickOrderDetailsModel implements QuickOrderDetailsModel {
  const factory _QuickOrderDetailsModel(
          {@JsonKey(name: "order_status") required final String status,
          @JsonKey(name: "driver_data")
          required final DriverDateModel? driverData}) =
      _$QuickOrderDetailsModelImpl;

  factory _QuickOrderDetailsModel.fromJson(Map<String, dynamic> json) =
      _$QuickOrderDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: "order_status")
  String get status;
  @override
  @JsonKey(name: "driver_data")
  DriverDateModel? get driverData;

  /// Create a copy of QuickOrderDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickOrderDetailsModelImplCopyWith<_$QuickOrderDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
