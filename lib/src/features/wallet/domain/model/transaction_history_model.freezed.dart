// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_time')
  String get transactionTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'log_type')
  String get logType => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_doctype')
  String get referenceDoctype => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_name')
  String get referenceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_balance')
  int get walletBalance => throw _privateConstructorUsedError;

  /// Serializes this TransactionHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date') DateTime transactionDate,
      @JsonKey(name: 'transaction_time') String transactionTime,
      @JsonKey(name: 'log_type') String logType,
      int amount,
      @JsonKey(name: 'reference_doctype') String referenceDoctype,
      @JsonKey(name: 'reference_name') String referenceName,
      @JsonKey(name: 'wallet_balance') int walletBalance});
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? transactionTime = null,
    Object? logType = null,
    Object? amount = null,
    Object? referenceDoctype = null,
    Object? referenceName = null,
    Object? walletBalance = null,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionTime: null == transactionTime
          ? _value.transactionTime
          : transactionTime // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      referenceDoctype: null == referenceDoctype
          ? _value.referenceDoctype
          : referenceDoctype // ignore: cast_nullable_to_non_nullable
              as String,
      referenceName: null == referenceName
          ? _value.referenceName
          : referenceName // ignore: cast_nullable_to_non_nullable
              as String,
      walletBalance: null == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionHistoryImplCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$TransactionHistoryImplCopyWith(_$TransactionHistoryImpl value,
          $Res Function(_$TransactionHistoryImpl) then) =
      __$$TransactionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date') DateTime transactionDate,
      @JsonKey(name: 'transaction_time') String transactionTime,
      @JsonKey(name: 'log_type') String logType,
      int amount,
      @JsonKey(name: 'reference_doctype') String referenceDoctype,
      @JsonKey(name: 'reference_name') String referenceName,
      @JsonKey(name: 'wallet_balance') int walletBalance});
}

/// @nodoc
class __$$TransactionHistoryImplCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$TransactionHistoryImpl>
    implements _$$TransactionHistoryImplCopyWith<$Res> {
  __$$TransactionHistoryImplCopyWithImpl(_$TransactionHistoryImpl _value,
      $Res Function(_$TransactionHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? transactionTime = null,
    Object? logType = null,
    Object? amount = null,
    Object? referenceDoctype = null,
    Object? referenceName = null,
    Object? walletBalance = null,
  }) {
    return _then(_$TransactionHistoryImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionTime: null == transactionTime
          ? _value.transactionTime
          : transactionTime // ignore: cast_nullable_to_non_nullable
              as String,
      logType: null == logType
          ? _value.logType
          : logType // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      referenceDoctype: null == referenceDoctype
          ? _value.referenceDoctype
          : referenceDoctype // ignore: cast_nullable_to_non_nullable
              as String,
      referenceName: null == referenceName
          ? _value.referenceName
          : referenceName // ignore: cast_nullable_to_non_nullable
              as String,
      walletBalance: null == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionHistoryImpl implements _TransactionHistory {
  const _$TransactionHistoryImpl(
      {@JsonKey(name: 'transaction_date') required this.transactionDate,
      @JsonKey(name: 'transaction_time') required this.transactionTime,
      @JsonKey(name: 'log_type') required this.logType,
      required this.amount,
      @JsonKey(name: 'reference_doctype') required this.referenceDoctype,
      @JsonKey(name: 'reference_name') required this.referenceName,
      @JsonKey(name: 'wallet_balance') required this.walletBalance});

  factory _$TransactionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_date')
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'transaction_time')
  final String transactionTime;
  @override
  @JsonKey(name: 'log_type')
  final String logType;
  @override
  final int amount;
  @override
  @JsonKey(name: 'reference_doctype')
  final String referenceDoctype;
  @override
  @JsonKey(name: 'reference_name')
  final String referenceName;
  @override
  @JsonKey(name: 'wallet_balance')
  final int walletBalance;

  @override
  String toString() {
    return 'TransactionHistory(transactionDate: $transactionDate, transactionTime: $transactionTime, logType: $logType, amount: $amount, referenceDoctype: $referenceDoctype, referenceName: $referenceName, walletBalance: $walletBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.transactionTime, transactionTime) ||
                other.transactionTime == transactionTime) &&
            (identical(other.logType, logType) || other.logType == logType) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.referenceDoctype, referenceDoctype) ||
                other.referenceDoctype == referenceDoctype) &&
            (identical(other.referenceName, referenceName) ||
                other.referenceName == referenceName) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionDate, transactionTime,
      logType, amount, referenceDoctype, referenceName, walletBalance);

  /// Create a copy of TransactionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      __$$TransactionHistoryImplCopyWithImpl<_$TransactionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {@JsonKey(name: 'transaction_date')
      required final DateTime transactionDate,
      @JsonKey(name: 'transaction_time') required final String transactionTime,
      @JsonKey(name: 'log_type') required final String logType,
      required final int amount,
      @JsonKey(name: 'reference_doctype')
      required final String referenceDoctype,
      @JsonKey(name: 'reference_name') required final String referenceName,
      @JsonKey(name: 'wallet_balance')
      required final int walletBalance}) = _$TransactionHistoryImpl;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'transaction_time')
  String get transactionTime;
  @override
  @JsonKey(name: 'log_type')
  String get logType;
  @override
  int get amount;
  @override
  @JsonKey(name: 'reference_doctype')
  String get referenceDoctype;
  @override
  @JsonKey(name: 'reference_name')
  String get referenceName;
  @override
  @JsonKey(name: 'wallet_balance')
  int get walletBalance;

  /// Create a copy of TransactionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionHistoryImplCopyWith<_$TransactionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
