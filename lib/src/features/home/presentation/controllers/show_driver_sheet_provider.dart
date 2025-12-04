import 'package:ahtizam/src/features/home/presentation/controllers/quick_order_controller.dart';
import 'package:ahtizam/src/features/prices_offer/presentation/controllers/price_offer_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'show_driver_sheet_provider.g.dart';

@riverpod
bool showDriverSheet(Ref ref) {
  final quick = ref.watch(quickOrderControllerProvider);
  final hasQuickDetails = quick is AsyncData && quick.value?.orderDetails != null;

  // لو عندك PriceOffer يعتمد على selectedOffer:
  final offer = ref.watch(priceOfferControllerProvider);
  final hasOfferSelected = offer.value?.selectedOffer != null;

  return hasQuickDetails || hasOfferSelected;
}
