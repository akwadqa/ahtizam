import 'package:ahtizam/src/features/my_order_details/data/repositories/my_order_details_repository.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_order_details_controller.g.dart';

@riverpod
class MyOrderDetailsController extends _$MyOrderDetailsController {
  @override
  FutureOr<MyOrderDetailsModel?> build(String quickOrderId) async{
   await getOrderDetails(quickOrderId);
    return state.value; // or return Future.value(null);
  }

  Future<void> getOrderDetails(String quickOrderId) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repo = ref.read(myOrderDetailsRepositoryProvider);
      final result = await repo.getOrderDetails(quickOrderId: quickOrderId);
      return  result; 
    });
  }

  // void updateOrderDetails(MyOrderDetailsModel newOrderDetails) {
  //   state = AsyncData(ApiResponse.success(data: newOrderDetails));
  // }
}
