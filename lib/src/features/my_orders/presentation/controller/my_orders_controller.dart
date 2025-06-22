// controllers/my_orders_controller.dart
import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/features/my_orders/data/repositories/my_orders_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_orders_controller.g.dart';

// @Riverpod(keepAlive: true)
// class MyOrdersController extends _$MyOrdersController {
//   @override
//   FutureOr<ApiResponse<List<MyOrderDetailsModel>>?> build() async{
//   await  getAllOrders();
//   return state.value;

// // return null;
//     // return [
//     //   MyOrderModel(
//     //     driverName: "محمد",
//     //     driverImage: "https://i.pravatar.cc/150?img=3",
//     //     driverRating: 4.5,
//     //     otpNumber: "2525",
//     //     paymentMethod: "Apple Pay",
//     //     truckNumber: "KE232",
//     //     fromAddress: "شارع ألف",
//     //     toAddress: "شارع باء",
//     //     price: 50,
//     //     date: "20 أكتوبر 23",
//     //     time: "10:00 صباحا",
//     //     userLocation: LatLng(40.659569, -73.933783),
//     //     destinationLocation: LatLng(40.659555, -73.933766),
//     //     status: OrderStatus.accepted,
//     //   ),
//     //   MyOrderModel(
//     //     driverName: "محمد",
//     //     driverImage: "https://i.pravatar.cc/150?img=3",
//     //     driverRating: 4.5,
//     //     otpNumber: "2525",
//     //     paymentMethod: "Apple Pay",
//     //     truckNumber: "KE232",
//     //     fromAddress: "شارع ألف",
//     //     toAddress: "شارع باء",
//     //     price: 50,
//     //     date: "20 أكتوبر 23",
//     //     time: "10:00 صباحا",
//     //     userLocation: LatLng(40.659569, -73.933783),
//     //     destinationLocation: LatLng(40.659555, -73.933766),
//     //     status: OrderStatus.pending,
//     //   ),
//     //   MyOrderModel(
//     //     driverName: "محمد",
//     //     driverImage: "https://i.pravatar.cc/150?img=3",
//     //     driverRating: 4.5,
//     //     otpNumber: "2525",
//     //     paymentMethod: "Apple Pay",
//     //     truckNumber: "KE232",
//     //     fromAddress: "شارع ألف",
//     //     toAddress: "شارع باء",
//     //     price: 50,
//     //     date: "20 أكتوبر 23",
//     //     time: "10:00 صباحا",
//     //     userLocation: LatLng(40.659569, -73.933783),
//     //     destinationLocation: LatLng(40.659555, -73.933766),
//     //     status: OrderStatus.rejected,
//     //   ),
//     // ];
//   }

//   Future<ApiResponse<List<MyOrderDetailsModel>>?> getAllOrders() async {
//     state = const AsyncLoading();
//     try {
//       final repo = ref.read(myOrdersRepositoryProvider);
//       final result = await repo.getAllOrders();
//       final response = ApiResponse.success(data: result);
//       state = AsyncData(response.data);
//       return response.data;
//     } catch (e, st) {
//       final errorResponse = ApiResponse<List<MyOrderDetailsModel>>.error(
//         message: "Failed to Get order details: $e",
//       );
//       state = AsyncError(errorResponse, st);
//       return errorResponse;
//     }
//   }
//   // List<MyOrderDetailsModel> getFilteredOrders(OrderStatus? status) {
//   //   if (status == OrderStatus.accepted) {
//   //     return state;
//   //   }
//   //   return state.where((order) => order.status == status).toList();
//   // }
// }
@Riverpod(keepAlive: true)
class MyOrdersController extends _$MyOrdersController {
  List<MyOrderDetailsModel> _orders = [];
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  FutureOr<List<MyOrderDetailsModel>> build() async {
    return await fetchOrders(page: 1);
  }

  Future<List<MyOrderDetailsModel>> fetchOrders({required int page}) async {
    try {
          state = const AsyncLoading();

      final repo = ref.read(myOrdersRepositoryProvider);
      final response = await repo.getAllOrders(page: page);

      // افترض أن الدالة ترجع كائن يحتوي على:
      // data: List<MyOrderDetailsModel>
      // pagination: {...}
      _currentPage = response.pagination!.currentPage;
      _totalPages = response.pagination!.totalPages;

      if (page == 1) {
        _orders = response.data!;
      } else {
        _orders.addAll(response.data!);
      }

      state = AsyncData(_orders);
      return _orders;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await fetchOrders(page: nextPage);
    return result.isNotEmpty;
  }

  Future<bool> refreshOrders() async {
    _orders.clear();
    _currentPage = 1;
    _totalPages = 1;
    await fetchOrders(page: 1);
    return true;
  }
}
