
import 'package:ahtizam/src/features/notifications/data/repositories/orders_offers_notifications_repository.dart';
import 'package:ahtizam/src/features/notifications/domain/model/orders_offer_notifications_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_offers_notifications_controller.g.dart';


@riverpod
class OrdersOffersNotificationsController extends _$OrdersOffersNotificationsController {
  List<OrdersOfferNotificationsModel> _notifications = [];
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  FutureOr<List<OrdersOfferNotificationsModel>> build() async {
    return await fetchOrdersOffersNotifications(page: 1);
  }

  Future<List<OrdersOfferNotificationsModel>> fetchOrdersOffersNotifications(
      {required int page, bool showLoading = true}) async {
    try {
      if (showLoading) state = const AsyncLoading();

      final repo = ref.read(ordersOffersNotificationsRepositoryProvider);
      final response = await repo.getAllOrdersNotifications(page: page);

      // افترض أن الدالة ترجع كائن يحتوي على:
      // data: List<OrdersOfferNotificationsModel>
      // pagination: {...}
      _currentPage = response.pagination!.currentPage;
      _totalPages = response.pagination!.totalPages;

      if (page == 1) {
        _notifications =  List.from(response.data!);
      } else {
        _notifications.addAll(response.data!);
      }

      state = AsyncData(_notifications);
      return _notifications;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await fetchOrdersOffersNotifications(page: nextPage,showLoading: false);
    return result.isNotEmpty;
  }

  Future<bool> ***REMOVED***Orders() async {
    _notifications.clear();
    _currentPage = 1;
    _totalPages = 1;
    await fetchOrdersOffersNotifications(page: 1);
    return true;
  }

  // List<OrdersOfferNotificationsModel> getFilteredOrders(MyorderStatus? status) {
  // if (status == MyorderStatus.all) {
  //     return state.value!;
  //   }    
  //   return state.value?.where((order) => order.status == status?.name).toList()??[];
  // }
  
}
