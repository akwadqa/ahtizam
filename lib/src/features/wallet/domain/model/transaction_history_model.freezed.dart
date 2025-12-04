// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionHistory {

@JsonKey(name: 'transaction_date') DateTime get transactionDate;@JsonKey(name: 'transaction_time') String get transactionTime;@JsonKey(name: 'log_type') String get logType; int get amount;@JsonKey(name: 'reference_doctype') String get referenceDoctype;@JsonKey(name: 'reference_name') String get referenceName;@JsonKey(name: 'wallet_balance') int get walletBalance;
/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionHistoryCopyWith<TransactionHistory> get copyWith => _$TransactionHistoryCopyWithImpl<TransactionHistory>(this as TransactionHistory, _$identity);

  /// Serializes this TransactionHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionHistory&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transactionTime, transactionTime) || other.transactionTime == transactionTime)&&(identical(other.logType, logType) || other.logType == logType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceDoctype, referenceDoctype) || other.referenceDoctype == referenceDoctype)&&(identical(other.referenceName, referenceName) || other.referenceName == referenceName)&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionDate,transactionTime,logType,amount,referenceDoctype,referenceName,walletBalance);

@override
String toString() {
  return 'TransactionHistory(transactionDate: $transactionDate, transactionTime: $transactionTime, logType: $logType, amount: $amount, referenceDoctype: $referenceDoctype, referenceName: $referenceName, walletBalance: $walletBalance)';
}


}

/// @nodoc
abstract mixin class $TransactionHistoryCopyWith<$Res>  {
  factory $TransactionHistoryCopyWith(TransactionHistory value, $Res Function(TransactionHistory) _then) = _$TransactionHistoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'transaction_date') DateTime transactionDate,@JsonKey(name: 'transaction_time') String transactionTime,@JsonKey(name: 'log_type') String logType, int amount,@JsonKey(name: 'reference_doctype') String referenceDoctype,@JsonKey(name: 'reference_name') String referenceName,@JsonKey(name: 'wallet_balance') int walletBalance
});




}
/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._self, this._then);

  final TransactionHistory _self;
  final $Res Function(TransactionHistory) _then;

/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionDate = null,Object? transactionTime = null,Object? logType = null,Object? amount = null,Object? referenceDoctype = null,Object? referenceName = null,Object? walletBalance = null,}) {
  return _then(_self.copyWith(
transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,transactionTime: null == transactionTime ? _self.transactionTime : transactionTime // ignore: cast_nullable_to_non_nullable
as String,logType: null == logType ? _self.logType : logType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,referenceDoctype: null == referenceDoctype ? _self.referenceDoctype : referenceDoctype // ignore: cast_nullable_to_non_nullable
as String,referenceName: null == referenceName ? _self.referenceName : referenceName // ignore: cast_nullable_to_non_nullable
as String,walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionHistory].
extension TransactionHistoryPatterns on TransactionHistory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionHistory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionHistory value)  $default,){
final _that = this;
switch (_that) {
case _TransactionHistory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionHistory value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionHistory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'transaction_date')  DateTime transactionDate, @JsonKey(name: 'transaction_time')  String transactionTime, @JsonKey(name: 'log_type')  String logType,  int amount, @JsonKey(name: 'reference_doctype')  String referenceDoctype, @JsonKey(name: 'reference_name')  String referenceName, @JsonKey(name: 'wallet_balance')  int walletBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionHistory() when $default != null:
return $default(_that.transactionDate,_that.transactionTime,_that.logType,_that.amount,_that.referenceDoctype,_that.referenceName,_that.walletBalance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'transaction_date')  DateTime transactionDate, @JsonKey(name: 'transaction_time')  String transactionTime, @JsonKey(name: 'log_type')  String logType,  int amount, @JsonKey(name: 'reference_doctype')  String referenceDoctype, @JsonKey(name: 'reference_name')  String referenceName, @JsonKey(name: 'wallet_balance')  int walletBalance)  $default,) {final _that = this;
switch (_that) {
case _TransactionHistory():
return $default(_that.transactionDate,_that.transactionTime,_that.logType,_that.amount,_that.referenceDoctype,_that.referenceName,_that.walletBalance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'transaction_date')  DateTime transactionDate, @JsonKey(name: 'transaction_time')  String transactionTime, @JsonKey(name: 'log_type')  String logType,  int amount, @JsonKey(name: 'reference_doctype')  String referenceDoctype, @JsonKey(name: 'reference_name')  String referenceName, @JsonKey(name: 'wallet_balance')  int walletBalance)?  $default,) {final _that = this;
switch (_that) {
case _TransactionHistory() when $default != null:
return $default(_that.transactionDate,_that.transactionTime,_that.logType,_that.amount,_that.referenceDoctype,_that.referenceName,_that.walletBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionHistory implements TransactionHistory {
  const _TransactionHistory({@JsonKey(name: 'transaction_date') required this.transactionDate, @JsonKey(name: 'transaction_time') required this.transactionTime, @JsonKey(name: 'log_type') required this.logType, required this.amount, @JsonKey(name: 'reference_doctype') required this.referenceDoctype, @JsonKey(name: 'reference_name') required this.referenceName, @JsonKey(name: 'wallet_balance') required this.walletBalance});
  factory _TransactionHistory.fromJson(Map<String, dynamic> json) => _$TransactionHistoryFromJson(json);

@override@JsonKey(name: 'transaction_date') final  DateTime transactionDate;
@override@JsonKey(name: 'transaction_time') final  String transactionTime;
@override@JsonKey(name: 'log_type') final  String logType;
@override final  int amount;
@override@JsonKey(name: 'reference_doctype') final  String referenceDoctype;
@override@JsonKey(name: 'reference_name') final  String referenceName;
@override@JsonKey(name: 'wallet_balance') final  int walletBalance;

/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionHistoryCopyWith<_TransactionHistory> get copyWith => __$TransactionHistoryCopyWithImpl<_TransactionHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionHistory&&(identical(other.transactionDate, transactionDate) || other.transactionDate == transactionDate)&&(identical(other.transactionTime, transactionTime) || other.transactionTime == transactionTime)&&(identical(other.logType, logType) || other.logType == logType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.referenceDoctype, referenceDoctype) || other.referenceDoctype == referenceDoctype)&&(identical(other.referenceName, referenceName) || other.referenceName == referenceName)&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transactionDate,transactionTime,logType,amount,referenceDoctype,referenceName,walletBalance);

@override
String toString() {
  return 'TransactionHistory(transactionDate: $transactionDate, transactionTime: $transactionTime, logType: $logType, amount: $amount, referenceDoctype: $referenceDoctype, referenceName: $referenceName, walletBalance: $walletBalance)';
}


}

/// @nodoc
abstract mixin class _$TransactionHistoryCopyWith<$Res> implements $TransactionHistoryCopyWith<$Res> {
  factory _$TransactionHistoryCopyWith(_TransactionHistory value, $Res Function(_TransactionHistory) _then) = __$TransactionHistoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'transaction_date') DateTime transactionDate,@JsonKey(name: 'transaction_time') String transactionTime,@JsonKey(name: 'log_type') String logType, int amount,@JsonKey(name: 'reference_doctype') String referenceDoctype,@JsonKey(name: 'reference_name') String referenceName,@JsonKey(name: 'wallet_balance') int walletBalance
});




}
/// @nodoc
class __$TransactionHistoryCopyWithImpl<$Res>
    implements _$TransactionHistoryCopyWith<$Res> {
  __$TransactionHistoryCopyWithImpl(this._self, this._then);

  final _TransactionHistory _self;
  final $Res Function(_TransactionHistory) _then;

/// Create a copy of TransactionHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionDate = null,Object? transactionTime = null,Object? logType = null,Object? amount = null,Object? referenceDoctype = null,Object? referenceName = null,Object? walletBalance = null,}) {
  return _then(_TransactionHistory(
transactionDate: null == transactionDate ? _self.transactionDate : transactionDate // ignore: cast_nullable_to_non_nullable
as DateTime,transactionTime: null == transactionTime ? _self.transactionTime : transactionTime // ignore: cast_nullable_to_non_nullable
as String,logType: null == logType ? _self.logType : logType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,referenceDoctype: null == referenceDoctype ? _self.referenceDoctype : referenceDoctype // ignore: cast_nullable_to_non_nullable
as String,referenceName: null == referenceName ? _self.referenceName : referenceName // ignore: cast_nullable_to_non_nullable
as String,walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
