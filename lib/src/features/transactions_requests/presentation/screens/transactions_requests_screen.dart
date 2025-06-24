import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/wallet/domain/model/transaction_history_model.dart';
import 'package:ahtizam/src/features/wallet/presentation/controller/wallet_controller.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/transactions_item_widget.dart';
@RoutePage()
class WithdrawRequestsScreen extends ConsumerWidget {
  const WithdrawRequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final withdraws = ref.watch(walletControllerProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('withdraw_requests')),
      ),
      body: withdraws.when(
        data: (wallet) => wallet.transactionHistory.isEmpty
            ? Center(
                child: Text(
                  context.tr('no_withdraw_requests'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            : _withdrawList(context, wallet.transactionHistory),
       loading: () => const FadeCircleLoadingIndicator().centered(),
        error: (err, _) => Center(child: Text(err.toString())),
      ),
    );
  }

  Widget _withdrawList(BuildContext context, List<TransactionHistory> transactions) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => 12.verticalSpace,
      itemBuilder: (context, index) => WithdrawItemWidget(
        transaction: transactions[index],
        isOrdered: true,
      ),
    );
  }
}
