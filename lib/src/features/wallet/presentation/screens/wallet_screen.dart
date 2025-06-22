import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/withdraw_requests/presentation/widgets/withdraw_item_widget.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:ahtizam/src/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../shared_widgets/custom_button_widget.dart';

@RoutePage()
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('wallet')),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildBalanceSection(context),
          24.verticalSpace,
          _buildBalanceButtonsSection(context),
          36.verticalSpace,
          _buildTransactionHeader(context),
          16.verticalSpace,
          _buildTransactionList(context),
        ],
      ),
    );
  }

  Widget _buildBalanceSection(BuildContext context) {
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
            _buildBalanceAmount(context),
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

  Widget _buildBalanceAmount(BuildContext context) {
    return Text(
      '1000 ${context.tr('currency')}',
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
            onTap: () {},
            backgroundColor: AppColors.primary,
            isFiled: true,
            color: AppColors.black,
            height: 52,
            radius: 12,
            fontSize: 16,
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
        // 20.horizontalSpace,
        // Expanded(
        //   child: CustomButtonWidget(
        //     text: context.tr('withdraw_money'),
        //     onTap: () {},
        //     backgroundColor: AppColors.black,
        //     isFiled: true,
        //     height: 52,
        //     radius: 12,
        //     fontSize: 18,
        //     width: MediaQuery.sizeOf(context).width,
        //   ),
        // ),
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

  Widget _buildTransactionList(BuildContext context) {
    final List<Map<String, dynamic>> data = List.generate(
      10,
      (index) => {
        "amount": "326.800",
        "order": "1515",
        "date": context.tr('transaction_date', args: ['1 ديسمبر']),
        "status": context.tr('pending'),
      },
    );
    return Expanded(
      child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => WithdrawItemWidget(
          data: data[index],
          isOrdered: false,
        ),
      ),
    );
  }
}
