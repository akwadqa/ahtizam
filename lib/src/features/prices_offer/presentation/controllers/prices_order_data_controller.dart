import 'package:ahtizam/src/features/home/domain/models/order/price_offer/driver_offer_model.dart';
import 'package:flutter_riverpod/legacy.dart';
enum PriceFilterType {
  all,
  nearest,
  cheapest,
}
final pricesOfferDataControllerProvider =
    StateNotifierProvider<PricesOrderDataController, List<DriverOfferModel>>(
  (ref) => PricesOrderDataController(),
);

class PricesOrderDataController extends StateNotifier<List<DriverOfferModel>> {
  PricesOrderDataController() : super([]);

  void setOffers(List<DriverOfferModel> offers) {
    state = offers;
  }

  List<DriverOfferModel> getFilteredData(PriceFilterType filter) {
    switch (filter) {
      case PriceFilterType.nearest:
        return [...state]..sort((a, b) {
          // sort by ETA distance (nearest first)
          final aDistance = a.eta.toLowerCase().contains("km") == true
              ? double.tryParse(a.eta.split(" ").first) ?? double.infinity
              : double.infinity;
          final bDistance = b.eta.toLowerCase().contains("km") == true
              ? double.tryParse(b.eta.split(" ").first) ?? double.infinity
              : double.infinity;
          return aDistance.compareTo(bDistance);
        });

      case PriceFilterType.cheapest:
        return [...state]..sort((a, b) {
          final aPrice = a.price ?? double.infinity;
          final bPrice = b.price ?? double.infinity;
          return aPrice.compareTo(bPrice);
        });

      case PriceFilterType.all:
      default:
        return state;
    }
  }
}
