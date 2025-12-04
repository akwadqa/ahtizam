
import 'package:ahtizam/src/features/wallet/domain/model/transaction_history_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';


@freezed
abstract class WalletModel with _$WalletModel {
    const factory WalletModel({
       @JsonKey(name: 'wallet_balance') required int walletBalance,
       @JsonKey(name: 'transaction_history') required List<TransactionHistory> transactionHistory,
    }) = _WalletModel;

    factory WalletModel.fromJson(Map<String, dynamic> json) => _$WalletModelFromJson(json);
}