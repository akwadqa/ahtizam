import 'package:ahtizam/src/features/my_order_details/data/datasources/my_order_details_datasource.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_order_details_repository.g.dart';

@Riverpod(keepAlive: true)
MyOrderDetailsRepository myOrderDetailsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return MyOrderDetailsRepository(MyOrderDetailsDatasource(networkService));
}

class MyOrderDetailsRepository {
  final MyOrderDetailsDatasource _remoteDataSource;

  MyOrderDetailsRepository(this._remoteDataSource);


  Future<MyOrderDetailsModel> getOrderDetails({
    required String quickOrderId,
  }) async {
    try {
      final result = await _remoteDataSource.getOrderDetails(quickOrderId);

      if (result.status == 200) {
        return result.data!;
      } else {
        throw Exception('Failed to Get order details: ${result.message}');
      } 
    } catch (e) {
      throw Exception('Failed to Get order details: $e');
    }
  }

  // }
}
