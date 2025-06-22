// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fare_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FareDetails _$FareDetailsFromJson(Map<String, dynamic> json) {
  return _FareDetails.fromJson(json);
}

/// @nodoc
mixin _$FareDetails {
  @JsonKey(name: "base_fare")
  double get baseFare => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  int? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "tax_fee")
  double get taxFee => throw _privateConstructorUsedError;
  @JsonKey(name: "final_fare")
  double get finalFare => throw _privateConstructorUsedError;

  /// Serializes this FareDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FareDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FareDetailsCopyWith<FareDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FareDetailsCopyWith<$Res> {
  factory $FareDetailsCopyWith(
          FareDetails value, $Res Function(FareDetails) then) =
      _$FareDetailsCopyWithImpl<$Res, FareDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "base_fare") double baseFare,
      @JsonKey(name: "discount_amount") int? discountAmount,
      @JsonKey(name: "tax_fee") double taxFee,
      @JsonKey(name: "final_fare") double finalFare});
}

/// @nodoc
class _$FareDetailsCopyWithImpl<$Res, $Val extends FareDetails>
    implements $FareDetailsCopyWith<$Res> {
  _$FareDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FareDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseFare = null,
    Object? discountAmount = freezed,
    Object? taxFee = null,
    Object? finalFare = null,
  }) {
    return _then(_value.copyWith(
      baseFare: null == baseFare
          ? _value.baseFare
          : baseFare // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      taxFee: null == taxFee
          ? _value.taxFee
          : taxFee // ignore: cast_nullable_to_non_nullable
              as double,
      finalFare: null == finalFare
          ? _value.finalFare
          : finalFare // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FareDetailsImplCopyWith<$Res>
    implements $FareDetailsCopyWith<$Res> {
  factory _$$FareDetailsImplCopyWith(
          _$FareDetailsImpl value, $Res Function(_$FareDetailsImpl) then) =
      __$$FareDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "base_fare") double baseFare,
      @JsonKey(name: "discount_amount") int? discountAmount,
      @JsonKey(name: "tax_fee") double taxFee,
      @JsonKey(name: "final_fare") double finalFare});
}

/// @nodoc
class __$$FareDetailsImplCopyWithImpl<$Res>
    extends _$FareDetailsCopyWithImpl<$Res, _$FareDetailsImpl>
    implements _$$FareDetailsImplCopyWith<$Res> {
  __$$FareDetailsImplCopyWithImpl(
      _$FareDetailsImpl _value, $Res Function(_$FareDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FareDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseFare = null,
    Object? discountAmount = freezed,
    Object? taxFee = null,
    Object? finalFare = null,
  }) {
    return _then(_$FareDetailsImpl(
      baseFare: null == baseFare
          ? _value.baseFare
          : baseFare // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      taxFee: null == taxFee
          ? _value.taxFee
          : taxFee // ignore: cast_nullable_to_non_nullable
              as double,
      finalFare: null == finalFare
          ? _value.finalFare
          : finalFare // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FareDetailsImpl implements _FareDetails {
  const _$FareDetailsImpl(
      {@JsonKey(name: "base_fare") required this.baseFare,
      @JsonKey(name: "discount_amount") this.discountAmount,
      @JsonKey(name: "tax_fee") required this.taxFee,
      @JsonKey(name: "final_fare") required this.finalFare});

  factory _$FareDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FareDetailsImplFromJson(json);

  @override
  @JsonKey(name: "base_fare")
  final double baseFare;
  @override
  @JsonKey(name: "discount_amount")
  final int? discountAmount;
  @override
  @JsonKey(name: "tax_fee")
  final double taxFee;
  @override
  @JsonKey(name: "final_fare")
  final double finalFare;

  @override
  String toString() {
    return 'FareDetails(baseFare: $baseFare, discountAmount: $discountAmount, taxFee: $taxFee, finalFare: $finalFare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FareDetailsImpl &&
            (identical(other.baseFare, baseFare) ||
                other.baseFare == baseFare) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxFee, taxFee) || other.taxFee == taxFee) &&
            (identical(other.finalFare, finalFare) ||
                other.finalFare == finalFare));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, baseFare, discountAmount, taxFee, finalFare);

  /// Create a copy of FareDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FareDetailsImplCopyWith<_$FareDetailsImpl> get copyWith =>
      __$$FareDetailsImplCopyWithImpl<_$FareDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FareDetailsImplToJson(
      this,
    );
  }
}

abstract class _FareDetails implements FareDetails {
  const factory _FareDetails(
          {@JsonKey(name: "base_fare") required final double baseFare,
          @JsonKey(name: "discount_amount") final int? discountAmount,
          @JsonKey(name: "tax_fee") required final double taxFee,
          @JsonKey(name: "final_fare") required final double finalFare}) =
      _$FareDetailsImpl;

  factory _FareDetails.fromJson(Map<String, dynamic> json) =
      _$FareDetailsImpl.fromJson;

  @override
  @JsonKey(name: "base_fare")
  double get baseFare;
  @override
  @JsonKey(name: "discount_amount")
  int? get discountAmount;
  @override
  @JsonKey(name: "tax_fee")
  double get taxFee;
  @override
  @JsonKey(name: "final_fare")
  double get finalFare;

  /// Create a copy of FareDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FareDetailsImplCopyWith<_$FareDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
