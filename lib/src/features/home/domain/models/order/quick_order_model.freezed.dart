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
  @JsonKey(name: "base_fee")
  double get baseFee => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_fee")
  double get taxFee => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_cost")
  double? get discountCost => throw _privateConstructorUsedError;
  @JsonKey(name: "final_fee")
  double get finalFee =>
      throw _privateConstructorUsedError; //  distance, duration
  String get eta => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: "quick_order_id") String quickOrderId,
      @JsonKey(name: "base_fee") double baseFee,
      @JsonKey(name: "tax_fee") double taxFee,
      @JsonKey(name: "discount_cost") double? discountCost,
      @JsonKey(name: "final_fee") double finalFee,
      String eta});
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
    Object? baseFee = null,
    Object? taxFee = null,
    Object? discountCost = freezed,
    Object? finalFee = null,
    Object? eta = null,
  }) {
    return _then(_value.copyWith(
      quickOrderId: null == quickOrderId
          ? _value.quickOrderId
          : quickOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      baseFee: null == baseFee
          ? _value.baseFee
          : baseFee // ignore: cast_nullable_to_non_nullable
              as double,
      taxFee: null == taxFee
          ? _value.taxFee
          : taxFee // ignore: cast_nullable_to_non_nullable
              as double,
      discountCost: freezed == discountCost
          ? _value.discountCost
          : discountCost // ignore: cast_nullable_to_non_nullable
              as double?,
      finalFee: null == finalFee
          ? _value.finalFee
          : finalFee // ignore: cast_nullable_to_non_nullable
              as double,
      eta: null == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {@JsonKey(name: "quick_order_id") String quickOrderId,
      @JsonKey(name: "base_fee") double baseFee,
      @JsonKey(name: "tax_fee") double taxFee,
      @JsonKey(name: "discount_cost") double? discountCost,
      @JsonKey(name: "final_fee") double finalFee,
      String eta});
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
    Object? baseFee = null,
    Object? taxFee = null,
    Object? discountCost = freezed,
    Object? finalFee = null,
    Object? eta = null,
  }) {
    return _then(_$QuickOrderModelImpl(
      quickOrderId: null == quickOrderId
          ? _value.quickOrderId
          : quickOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      baseFee: null == baseFee
          ? _value.baseFee
          : baseFee // ignore: cast_nullable_to_non_nullable
              as double,
      taxFee: null == taxFee
          ? _value.taxFee
          : taxFee // ignore: cast_nullable_to_non_nullable
              as double,
      discountCost: freezed == discountCost
          ? _value.discountCost
          : discountCost // ignore: cast_nullable_to_non_nullable
              as double?,
      finalFee: null == finalFee
          ? _value.finalFee
          : finalFee // ignore: cast_nullable_to_non_nullable
              as double,
      eta: null == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickOrderModelImpl implements _QuickOrderModel {
  const _$QuickOrderModelImpl(
      {@JsonKey(name: "quick_order_id") required this.quickOrderId,
      @JsonKey(name: "base_fee") required this.baseFee,
      @JsonKey(name: "tax_fee") required this.taxFee,
      @JsonKey(name: "discount_cost") required this.discountCost,
      @JsonKey(name: "final_fee") required this.finalFee,
      required this.eta});

  factory _$QuickOrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickOrderModelImplFromJson(json);

  @override
  @JsonKey(name: "quick_order_id")
  final String quickOrderId;
  @override
  @JsonKey(name: "base_fee")
  final double baseFee;
  @override
  @JsonKey(name: "tax_fee")
  final double taxFee;
  @override
  @JsonKey(name: "discount_cost")
  final double? discountCost;
  @override
  @JsonKey(name: "final_fee")
  final double finalFee;
//  distance, duration
  @override
  final String eta;

  @override
  String toString() {
    return 'QuickOrderModel(quickOrderId: $quickOrderId, baseFee: $baseFee, taxFee: $taxFee, discountCost: $discountCost, finalFee: $finalFee, eta: $eta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickOrderModelImpl &&
            (identical(other.quickOrderId, quickOrderId) ||
                other.quickOrderId == quickOrderId) &&
            (identical(other.baseFee, baseFee) || other.baseFee == baseFee) &&
            (identical(other.taxFee, taxFee) || other.taxFee == taxFee) &&
            (identical(other.discountCost, discountCost) ||
                other.discountCost == discountCost) &&
            (identical(other.finalFee, finalFee) ||
                other.finalFee == finalFee) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, quickOrderId, baseFee, taxFee, discountCost, finalFee, eta);

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
      {@JsonKey(name: "quick_order_id") required final String quickOrderId,
      @JsonKey(name: "base_fee") required final double baseFee,
      @JsonKey(name: "tax_fee") required final double taxFee,
      @JsonKey(name: "discount_cost") required final double? discountCost,
      @JsonKey(name: "final_fee") required final double finalFee,
      required final String eta}) = _$QuickOrderModelImpl;

  factory _QuickOrderModel.fromJson(Map<String, dynamic> json) =
      _$QuickOrderModelImpl.fromJson;

  @override
  @JsonKey(name: "quick_order_id")
  String get quickOrderId;
  @override
  @JsonKey(name: "base_fee")
  double get baseFee;
  @override
  @JsonKey(name: "tax_fee")
  double get taxFee;
  @override
  @JsonKey(name: "discount_cost")
  double? get discountCost;
  @override
  @JsonKey(name: "final_fee")
  double get finalFee; //  distance, duration
  @override
  String get eta;

  /// Create a copy of QuickOrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickOrderModelImplCopyWith<_$QuickOrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
