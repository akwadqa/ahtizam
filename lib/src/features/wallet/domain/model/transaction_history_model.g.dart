// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryImpl _$$TransactionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryImpl(
      transactionDate: DateTime.parse(json['transaction_date'] as String),
      transactionTime: json['transaction_time'] as String,
      logType: json['log_type'] as String,
      amount: (json['amount'] as num).toInt(),
      referenceDoctype: json['reference_doctype'] as String,
      referenceName: json['reference_name'] as String,
      walletBalance: (json['wallet_balance'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionHistoryImplToJson(
        _$TransactionHistoryImpl instance) =>
    <String, dynamic>{
      'transaction_date': instance.transactionDate.toIso8601String(),
      'transaction_time': instance.transactionTime,
      'log_type': instance.logType,
      'amount': instance.amount,
      'reference_doctype': instance.referenceDoctype,
      'reference_name': instance.referenceName,
      'wallet_balance': instance.walletBalance,
    };
