// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletModel {

@JsonKey(name: 'wallet_balance') int get walletBalance;@JsonKey(name: 'transaction_history') List<TransactionHistory> get transactionHistory;
/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletModelCopyWith<WalletModel> get copyWith => _$WalletModelCopyWithImpl<WalletModel>(this as WalletModel, _$identity);

  /// Serializes this WalletModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletModel&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&const DeepCollectionEquality().equals(other.transactionHistory, transactionHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletBalance,const DeepCollectionEquality().hash(transactionHistory));

@override
String toString() {
  return 'WalletModel(walletBalance: $walletBalance, transactionHistory: $transactionHistory)';
}


}

/// @nodoc
abstract mixin class $WalletModelCopyWith<$Res>  {
  factory $WalletModelCopyWith(WalletModel value, $Res Function(WalletModel) _then) = _$WalletModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'wallet_balance') int walletBalance,@JsonKey(name: 'transaction_history') List<TransactionHistory> transactionHistory
});




}
/// @nodoc
class _$WalletModelCopyWithImpl<$Res>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._self, this._then);

  final WalletModel _self;
  final $Res Function(WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? walletBalance = null,Object? transactionHistory = null,}) {
  return _then(_self.copyWith(
walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as int,transactionHistory: null == transactionHistory ? _self.transactionHistory : transactionHistory // ignore: cast_nullable_to_non_nullable
as List<TransactionHistory>,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletModel].
extension WalletModelPatterns on WalletModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletModel value)  $default,){
final _that = this;
switch (_that) {
case _WalletModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletModel value)?  $default,){
final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'wallet_balance')  int walletBalance, @JsonKey(name: 'transaction_history')  List<TransactionHistory> transactionHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.walletBalance,_that.transactionHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'wallet_balance')  int walletBalance, @JsonKey(name: 'transaction_history')  List<TransactionHistory> transactionHistory)  $default,) {final _that = this;
switch (_that) {
case _WalletModel():
return $default(_that.walletBalance,_that.transactionHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'wallet_balance')  int walletBalance, @JsonKey(name: 'transaction_history')  List<TransactionHistory> transactionHistory)?  $default,) {final _that = this;
switch (_that) {
case _WalletModel() when $default != null:
return $default(_that.walletBalance,_that.transactionHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletModel implements WalletModel {
  const _WalletModel({@JsonKey(name: 'wallet_balance') required this.walletBalance, @JsonKey(name: 'transaction_history') required final  List<TransactionHistory> transactionHistory}): _transactionHistory = transactionHistory;
  factory _WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);

@override@JsonKey(name: 'wallet_balance') final  int walletBalance;
 final  List<TransactionHistory> _transactionHistory;
@override@JsonKey(name: 'transaction_history') List<TransactionHistory> get transactionHistory {
  if (_transactionHistory is EqualUnmodifiableListView) return _transactionHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionHistory);
}


/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletModelCopyWith<_WalletModel> get copyWith => __$WalletModelCopyWithImpl<_WalletModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletModel&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&const DeepCollectionEquality().equals(other._transactionHistory, _transactionHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletBalance,const DeepCollectionEquality().hash(_transactionHistory));

@override
String toString() {
  return 'WalletModel(walletBalance: $walletBalance, transactionHistory: $transactionHistory)';
}


}

/// @nodoc
abstract mixin class _$WalletModelCopyWith<$Res> implements $WalletModelCopyWith<$Res> {
  factory _$WalletModelCopyWith(_WalletModel value, $Res Function(_WalletModel) _then) = __$WalletModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'wallet_balance') int walletBalance,@JsonKey(name: 'transaction_history') List<TransactionHistory> transactionHistory
});




}
/// @nodoc
class __$WalletModelCopyWithImpl<$Res>
    implements _$WalletModelCopyWith<$Res> {
  __$WalletModelCopyWithImpl(this._self, this._then);

  final _WalletModel _self;
  final $Res Function(_WalletModel) _then;

/// Create a copy of WalletModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? walletBalance = null,Object? transactionHistory = null,}) {
  return _then(_WalletModel(
walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as int,transactionHistory: null == transactionHistory ? _self._transactionHistory : transactionHistory // ignore: cast_nullable_to_non_nullable
as List<TransactionHistory>,
  ));
}


}

// dart format on
