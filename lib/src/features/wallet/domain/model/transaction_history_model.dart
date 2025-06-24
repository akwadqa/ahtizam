import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';
@freezed
class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
    @JsonKey(name: 'transaction_time') required String transactionTime,
    @JsonKey(name: 'log_type') required String logType,
    required int amount,
    @JsonKey(name: 'reference_doctype') required String referenceDoctype,
    @JsonKey(name: 'reference_name') required String referenceName,
    @JsonKey(name: 'wallet_balance') required int walletBalance,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}
