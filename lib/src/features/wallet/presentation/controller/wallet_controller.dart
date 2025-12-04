// controllers/wallet_controller.dart
import 'package:ahtizam/gen/assets.gen.dart';
import 'package:ahtizam/src/features/payment/data/repositories/payment_repository.dart';
import 'package:ahtizam/src/features/payment/presentation/pages/payment_web_view.dart';
import 'package:ahtizam/src/features/wallet/data/repository/wallet_repository.dart';
import 'package:ahtizam/src/features/wallet/domain/model/transaction_history_model.dart';
import 'package:ahtizam/src/features/wallet/domain/model/wallet_model.dart';
import 'package:ahtizam/src/localization/current_language.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_controller.g.dart';

@Riverpod(keepAlive: true)
class WalletController extends _$WalletController {
  List<TransactionHistory> _history = [];
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  FutureOr<WalletModel> build() async {
    return await fetchWallet(page: 1);
  }

  Future<WalletModel> fetchWallet({required int page,bool showLoading = true}) async {
    try {
     if(showLoading) state = const AsyncLoading();

      final repo = ref.read(walletRepositoryProvider);
      final response = await repo.getWalletData(page);

      _currentPage = response.pagination!.currentPage;
      _totalPages = response.pagination!.totalPages;

      if (page == 1) {
        _history =List.from( response.data!.transactionHistory);
      } else {
        _history.addAll(response.data!.transactionHistory);
      }

      final wallet = WalletModel(
        walletBalance: response.data!.walletBalance,
        transactionHistory: _history,
      );

      state = AsyncData(wallet);
      return wallet;
    } catch (e, st) {
      state = AsyncError(e, st);
      return WalletModel(walletBalance: 0, transactionHistory: []);
    }
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await fetchWallet(page: nextPage,showLoading: false);
    return result.transactionHistory.isNotEmpty;
  }

  Future<bool> ***REMOVED***Wallet() async {
    _history.clear();
    _currentPage = 1;
    _totalPages = 1;
    await fetchWallet(page: 1);
    return true;
  }

  Future<void> processAddStock(String amount, BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
    );

    try {
      final repo = ref.read(walletRepositoryProvider);
      final walletId = await repo.getWalletRequestIdUrl(amount: amount);
      final lang = ref.watch(currentLanguageProvider);

      // if (walletId == null || walletId.isEmpty) throw "Missing wallet ID";

      // /// 1. Get payment URL from your backend
      final response = await ref.read(paymentRepositoryProvider).getPaymentUrl(
            orderId: walletId,
            language: lang,
          );

      final url = response.data;
      if (url == null) throw "Failed to get payment link";

      // Close loading before opening payment page
      // if (Navigator.of(context).canPop()) Navigator.pop(context);

      /// 2. Open the URL in browser or WebView and wait
      final paymentCompleted = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PaymentWebViewPage(redirectUrl: url),
        ),
      );

      /// 3. If user cancelled
      if (paymentCompleted != true) {
        showErrorDialog(context, "add amount  was not completed");
        return;
      }
      if (Navigator.of(context).canPop()) {
        Navigator.pop(context);
        Navigator.pop(context);
      }

      /// 4. Payment succeeded → show success
      // showSuccessPayment(context: context);
      showCustomDialog(
          context: context,
          icon: Assets.icons.verifiedCheckIc.svg(
            height: 50,
            width: 50,
          ),
          title: Text("amount_added_success".tr()));
      await ***REMOVED***Wallet();
    } catch (e) {
      debugPrint("ERRRROOOOOOOOR HERE ON FIRE add amount CONTROLLER $e");
      if (Navigator.of(context).canPop()) Navigator.pop(context);
      showErrorDialog(context, e.toString().replaceFirst("Exception: ", ""));
    }
  }

}
