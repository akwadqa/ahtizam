// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuickOrderModel _$QuickOrderModelFromJson(Map<String, dynamic> json) {
  return _QuickOrderModel.fromJson(json);
}

/// @nodoc
mixin _$QuickOrderModel {
  @JsonKey(name: "quick_order_id")
  String get quickOrderId => throw _privateConstructorUsedError;

  /// Serializes this QuickOrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuickOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickOrderModelCopyWith<QuickOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickOrderModelCopyWith<$Res> {
  factory $QuickOrderModelCopyWith(
          QuickOrderModel value, $Res Function(QuickOrderModel) then) =
      _$QuickOrderModelCopyWithImpl<$Res, QuickOrderModel>;
  @useResult
  $Res call({@JsonKey(name: "quick_order_id") String quickOrderId});
}

/// @nodoc
class _$QuickOrderModelCopyWithImpl<$Res, $Val extends QuickOrderModel>
    implements $QuickOrderModelCopyWith<$Res> {
  _$QuickOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickOrderId = null,
  }) {
    return _then(_value.copyWith(
      quickOrderId: null == quickOrderId
          ? _value.quickOrderId
          : quickOrderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuickOrderModelImplCopyWith<$Res>
    implements $QuickOrderModelCopyWith<$Res> {
  factory _$$QuickOrderModelImplCopyWith(_$QuickOrderModelImpl value,
          $Res Function(_$QuickOrderModelImpl) then) =
      __$$QuickOrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "quick_order_id") String quickOrderId});
}

/// @nodoc
class __$$QuickOrderModelImplCopyWithImpl<$Res>
    extends _$QuickOrderModelCopyWithImpl<$Res, _$QuickOrderModelImpl>
    implements _$$QuickOrderModelImplCopyWith<$Res> {
  __$$QuickOrderModelImplCopyWithImpl(
      _$QuickOrderModelImpl _value, $Res Function(_$QuickOrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuickOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quickOrderId = null,
  }) {
    return _then(_$QuickOrderModelImpl(
      quickOrderId: null == quickOrderId
          ? _value.quickOrderId
          : quickOrderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickOrderModelImpl implements _QuickOrderModel {
  const _$QuickOrderModelImpl(
      {@JsonKey(name: "quick_order_id") required this.quickOrderId});

  factory _$QuickOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickOrderModelImplFromJson(json);

  @override
  @JsonKey(name: "quick_order_id")
  final String quickOrderId;

  @override
  String toString() {
    return 'QuickOrderModel(quickOrderId: $quickOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickOrderModelImpl &&
            (identical(other.quickOrderId, quickOrderId) ||
                other.quickOrderId == quickOrderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quickOrderId);

  /// Create a copy of QuickOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickOrderModelImplCopyWith<_$QuickOrderModelImpl> get copyWith =>
      __$$QuickOrderModelImplCopyWithImpl<_$QuickOrderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickOrderModelImplToJson(
      this,
    );
  }
}

abstract class _QuickOrderModel implements QuickOrderModel {
  const factory _QuickOrderModel(
      {@JsonKey(name: "quick_order_id")
      required final String quickOrderId}) = _$QuickOrderModelImpl;

  factory _QuickOrderModel.fromJson(Map<String, dynamic> json) =
      _$QuickOrderModelImpl.fromJson;

  @override
  @JsonKey(name: "quick_order_id")
  String get quickOrderId;

  /// Create a copy of QuickOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickOrderModelImplCopyWith<_$QuickOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
