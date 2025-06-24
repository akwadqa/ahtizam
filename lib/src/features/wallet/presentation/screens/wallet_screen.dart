import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/extenssions/widget_extensions.dart';
import 'package:ahtizam/src/features/wallet/presentation/controller/wallet_controller.dart';
import 'package:ahtizam/src/features/transactions_requests/presentation/widgets/transactions_item_widget.dart';
import 'package:ahtizam/src/shared_widgets/app_dialogs.dart';
import 'package:ahtizam/src/shared_widgets/app_pagination_widget.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../shared_widgets/custom_button_widget.dart';

@RoutePage()
class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletAsync = ref.watch(walletControllerProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('wallet')),
      ),
      body: walletAsync.when(
        data: (wallet) => _buildBody(context, wallet.walletBalance, wallet.transactionHistory,ref),
        loading: () => const FadeCircleLoadingIndicator().centered(),
        error: (err, _) => Center(child: Text(err.toString())),
      ),
    );
  }

  Widget _buildBody(BuildContext context, int walletBalance, List transactionHistory,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBalanceSection(context, walletBalance),
          24.verticalSpace,
          _buildBalanceButtonsSection(context),
          36.verticalSpace,
          _buildTransactionHeader(context),
          16.verticalSpace,
          _buildTransactionList(context, transactionHistory,ref),
        ],
      ),
    );
  }

  Widget _buildBalanceSection(BuildContext context, int balance) {
    return Card(
      color: AppColors.replayGrey,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBalanceLabel(context),
            8.verticalSpace,
            _buildBalanceAmount(context, balance),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceLabel(BuildContext context) {
    return Text(
      context.tr('wallet_balance'),
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(fontSize: 15, color: AppColors.dimGray),
    );
  }

  Widget _buildBalanceAmount(BuildContext context, int balance) {
    return Text(
      '$balance ${context.tr('currency')}',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
    );
  }

  Widget _buildBalanceButtonsSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtonWidget(
            text: context.tr('add_money'),
            onTap: () {
              showWithdrawingDialog(context,);
            },
            backgroundColor: AppColors.primary,
            isFiled: true,
            color: AppColors.black,
            height: 52,
            radius: 12,
            fontSize: 16,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionHeader(BuildContext context) {
    return Text(
      context.tr('transaction_history'),
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 14, color: AppColors.nevy, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTransactionList(BuildContext context, List transactionHistory,WidgetRef ref) {
    return 
     Expanded(
       child: AppPaginationWidget(
            enablePullDown: true,
            onRefresh: () async {
              await ref.read(walletControllerProvider.notifier).refreshWallet();
              return true;
            },
            onLoading: (page) async {
              return await ref.read(walletControllerProvider.notifier).loadNextPage();
            },
            child: ListView.separated(
              itemCount: transactionHistory.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => WithdrawItemWidget(
                 transaction: transactionHistory[index],
                   
                isOrdered: false,
              ),
            )
          ),
     );
    
    
    
  }
}
