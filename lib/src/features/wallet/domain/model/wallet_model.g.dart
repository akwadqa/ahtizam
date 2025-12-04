// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => _WalletModel(
  walletBalance: (json['wallet_balance'] as num).toInt(),
  transactionHistory: (json['transaction_history'] as List<dynamic>)
      .map((e) => TransactionHistory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WalletModelToJson(_WalletModel instance) =>
    <String, dynamic>{
      'wallet_balance': instance.walletBalance,
      'transaction_history': instance.transactionHistory,
    };
