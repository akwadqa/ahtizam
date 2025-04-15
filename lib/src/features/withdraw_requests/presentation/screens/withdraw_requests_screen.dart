import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/shared_widgets/custom_appbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/withdraw_item_widget.dart';

@RoutePage()
class WithdrawRequestsScreen extends StatelessWidget {
  const WithdrawRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = List.generate(
      10,
      (index) => {
        "amount": "326.800",
        "order": "1515",
        "date": context.tr('transaction_date', args: ['1 ديسمبر']),
        "status": context.tr('pending'),
      },
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: context.tr('withdraw_requests')),
      ),
      body: data.isEmpty
          ? Center(
              child: Text(
                context.tr('no_withdraw_requests'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : _withdrawList(context, data),
    );
  }

  Widget _withdrawList(BuildContext context, List<Map<String, dynamic>> data) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      separatorBuilder: (_, __) => 12.verticalSpace,
      itemBuilder: (context, index) => WithdrawItemWidget(
        data: data[index],
        isOrdered: true,
      ),
    );
  }
}
