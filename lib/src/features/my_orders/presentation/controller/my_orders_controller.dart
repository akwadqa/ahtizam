// controllers/my_orders_controller.dart
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/features/my_orders/data/repositories/my_orders_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_orders_controller.g.dart';

@Riverpod(keepAlive: true)
class MyOrdersController extends _$MyOrdersController {
  List<MyOrderDetailsModel> _orders = [];
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  FutureOr<List<MyOrderDetailsModel>> build() async {
    return await fetchOrders(page: 1);
  }
  Future<List<MyOrderDetailsModel>> fetchOrders({
    required int page,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) {
        state = const AsyncLoading<List<MyOrderDetailsModel>>()
            .copyWithPrevious(state);
      }

      final repo = ref.read(myOrdersRepositoryProvider);
      final response = await repo.getAllOrders(page: page);

      final data = response.data ?? const <MyOrderDetailsModel>[];
      final pagination = response.pagination;

      _currentPage = pagination?.currentPage ?? page;
      _totalPages  = pagination?.totalPages  ?? _totalPages;

      if (page == 1) {
        _orders = List<MyOrderDetailsModel>.from(data);
      } else {
        _orders = [..._orders, ...data];
      }

      state = AsyncData(List<MyOrderDetailsModel>.unmodifiable(_orders));
      return _orders;
    } catch (e, st) {
      state = AsyncError(e, st);
      // keep previously loaded data instead of returning []
      return _orders;
    }
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await fetchOrders(page: nextPage,showLoading: false);
    return result.isNotEmpty;
  }

  Future<bool> ***REMOVED***Orders() async {
    _orders.clear();
    _currentPage = 1;
    _totalPages = 1;
    await fetchOrders(page: 1);
    return true;
  }
}
