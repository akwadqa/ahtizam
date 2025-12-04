import 'package:ahtizam/src/extenssions/int_extenssion.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/price_offer_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared_widgets/custom_appbar.dart';
import '../controllers/prices_filter_controller.dart';
import '../controllers/prices_order_data_controller.dart';
import '../widgets/price_offer_card.dart';
import '../widgets/prices_offer_filter.dart';

@RoutePage()
class PricesOfferScreen extends ConsumerWidget {
  const PricesOfferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(pricesFilterControllerProvider);
    final offerData = ref.watch(priceOfferControllerProvider);
    final pricesData = ref.watch(pricesOfferDataControllerProvider);
    final filteredData = ref
        .read(pricesOfferDataControllerProvider.notifier)
        .getFilteredData(selectedFilter);

    return Scaffold(
      // backgroundColor: AppColors.offWhite,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65),
        child: CustomAppbar(title: "prices_offer"),
      ),
      body: Column(
        children: [
          20.verticalSpace,
          const PricesOfferFilter(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: offerData.value?.availableOffers.length,
              itemBuilder: (context, index) {
                // final offer = offerData.value?.availableOffers[index];
                final offer = filteredData.isEmpty?offerData.value?.availableOffers[index]:filteredData[index];
                return PriceOfferCard(
                  priceOfferModel: offer!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
