import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'prices_order_data_controller.dart';
part 'prices_filter_controller.g.dart';

@riverpod
class PricesFilterController extends _$PricesFilterController {
  @override
  PriceFilterType build() {
    return PriceFilterType.all;
  }

  void changeFilter(PriceFilterType type) {
    state = type;
  }
}
