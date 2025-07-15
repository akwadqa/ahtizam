// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RatingParams _$RatingParamsFromJson(Map<String, dynamic> json) {
  return _RatingParams.fromJson(json);
}

/// @nodoc
mixin _$RatingParams {
  @JsonKey(name: 'driver_id')
  String get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  String get rating => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'reference_doctype')
  String? get referenceDoctype => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false, name: 'reference_name')
  String? get referenceName => throw _privateConstructorUsedError;

  /// Serializes this RatingParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingParamsCopyWith<RatingParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingParamsCopyWith<$Res> {
  factory $RatingParamsCopyWith(
          RatingParams value, $Res Function(RatingParams) then) =
      _$RatingParamsCopyWithImpl<$Res, RatingParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'rating') String rating,
      @JsonKey(includeIfNull: false) String? comment,
      @JsonKey(includeIfNull: false, name: 'reference_doctype')
      String? referenceDoctype,
      @JsonKey(includeIfNull: false, name: 'reference_name')
      String? referenceName});
}

/// @nodoc
class _$RatingParamsCopyWithImpl<$Res, $Val extends RatingParams>
    implements $RatingParamsCopyWith<$Res> {
  _$RatingParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? rating = null,
    Object? comment = freezed,
    Object? referenceDoctype = freezed,
    Object? referenceName = freezed,
  }) {
    return _then(_value.copyWith(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceDoctype: freezed == referenceDoctype
          ? _value.referenceDoctype
          : referenceDoctype // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceName: freezed == referenceName
          ? _value.referenceName
          : referenceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingParamsImplCopyWith<$Res>
    implements $RatingParamsCopyWith<$Res> {
  factory _$$RatingParamsImplCopyWith(
          _$RatingParamsImpl value, $Res Function(_$RatingParamsImpl) then) =
      __$$RatingParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'driver_id') String driverId,
      @JsonKey(name: 'rating') String rating,
      @JsonKey(includeIfNull: false) String? comment,
      @JsonKey(includeIfNull: false, name: 'reference_doctype')
      String? referenceDoctype,
      @JsonKey(includeIfNull: false, name: 'reference_name')
      String? referenceName});
}

/// @nodoc
class __$$RatingParamsImplCopyWithImpl<$Res>
    extends _$RatingParamsCopyWithImpl<$Res, _$RatingParamsImpl>
    implements _$$RatingParamsImplCopyWith<$Res> {
  __$$RatingParamsImplCopyWithImpl(
      _$RatingParamsImpl _value, $Res Function(_$RatingParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? driverId = null,
    Object? rating = null,
    Object? comment = freezed,
    Object? referenceDoctype = freezed,
    Object? referenceName = freezed,
  }) {
    return _then(_$RatingParamsImpl(
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceDoctype: freezed == referenceDoctype
          ? _value.referenceDoctype
          : referenceDoctype // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceName: freezed == referenceName
          ? _value.referenceName
          : referenceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingParamsImpl implements _RatingParams {
  const _$RatingParamsImpl(
      {@JsonKey(name: 'driver_id') required this.driverId,
      @JsonKey(name: 'rating') required this.rating,
      @JsonKey(includeIfNull: false) this.comment,
      @JsonKey(includeIfNull: false, name: 'reference_doctype')
      this.referenceDoctype,
      @JsonKey(includeIfNull: false, name: 'reference_name')
      this.referenceName});

  factory _$RatingParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingParamsImplFromJson(json);

  @override
  @JsonKey(name: 'driver_id')
  final String driverId;
  @override
  @JsonKey(name: 'rating')
  final String rating;
  @override
  @JsonKey(includeIfNull: false)
  final String? comment;
  @override
  @JsonKey(includeIfNull: false, name: 'reference_doctype')
  final String? referenceDoctype;
  @override
  @JsonKey(includeIfNull: false, name: 'reference_name')
  final String? referenceName;

  @override
  String toString() {
    return 'RatingParams(driverId: $driverId, rating: $rating, comment: $comment, referenceDoctype: $referenceDoctype, referenceName: $referenceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingParamsImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.referenceDoctype, referenceDoctype) ||
                other.referenceDoctype == referenceDoctype) &&
            (identical(other.referenceName, referenceName) ||
                other.referenceName == referenceName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, driverId, rating, comment, referenceDoctype, referenceName);

  /// Create a copy of RatingParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingParamsImplCopyWith<_$RatingParamsImpl> get copyWith =>
      __$$RatingParamsImplCopyWithImpl<_$RatingParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingParamsImplToJson(
      this,
    );
  }
}

abstract class _RatingParams implements RatingParams {
  const factory _RatingParams(
      {@JsonKey(name: 'driver_id') required final String driverId,
      @JsonKey(name: 'rating') required final String rating,
      @JsonKey(includeIfNull: false) final String? comment,
      @JsonKey(includeIfNull: false, name: 'reference_doctype')
      final String? referenceDoctype,
      @JsonKey(includeIfNull: false, name: 'reference_name')
      final String? referenceName}) = _$RatingParamsImpl;

  factory _RatingParams.fromJson(Map<String, dynamic> json) =
      _$RatingParamsImpl.fromJson;

  @override
  @JsonKey(name: 'driver_id')
  String get driverId;
  @override
  @JsonKey(name: 'rating')
  String get rating;
  @override
  @JsonKey(includeIfNull: false)
  String? get comment;
  @override
  @JsonKey(includeIfNull: false, name: 'reference_doctype')
  String? get referenceDoctype;
  @override
  @JsonKey(includeIfNull: false, name: 'reference_name')
  String? get referenceName;

  /// Create a copy of RatingParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingParamsImplCopyWith<_$RatingParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
