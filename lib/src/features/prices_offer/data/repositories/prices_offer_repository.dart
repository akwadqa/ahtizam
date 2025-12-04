import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/home/domain/models/order/quick_order_model.dart';
import 'package:ahtizam/src/features/prices_offer/data/datasources/prices_offer_data_source.dart';

import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prices_offer_repository.g.dart';

@Riverpod(keepAlive: true)
PricesOfferRepository pricesOfferRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return PricesOfferRepository(PricesOfferDataSource(networkService));
}

class PricesOfferRepository {
  final PricesOfferDataSource _remoteDataSource;

  PricesOfferRepository(this._remoteDataSource);

Future<ApiResponse<QuickOrderModel>> selectPriceOffer({
  required String orderOfferId,

}) async {
  final result = await _remoteDataSource.selectPricePffer(
    orderOfferId: orderOfferId
  );

  if (result.hasSucceeded) {
    return result;
  } else {
    return ApiResponse.error(
        message: result.message ?? 'Failed to confirm payment');
  }
}

}
