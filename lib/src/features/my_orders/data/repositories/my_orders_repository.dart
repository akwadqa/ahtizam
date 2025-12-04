import 'package:ahtizam/src/constants/Api/api_response.dart';
import 'package:ahtizam/src/features/my_order_details/domain/model/my_order_details_model.dart';

import 'package:ahtizam/src/features/my_orders/data/datasources/my_orders_datasource.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_orders_repository.g.dart';

@Riverpod(keepAlive: true)
MyOrdersRepository myOrdersRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return MyOrdersRepository(MyOrdersDatasource(networkService));
}

class MyOrdersRepository {
  final MyOrdersDatasource _remoteDataSource;

  MyOrdersRepository(this._remoteDataSource);

  Future<ApiResponse<List<MyOrderDetailsModel>>> getAllOrders(
      {required int page}) async {
    try {
      final result = await _remoteDataSource.getAllOrders(page);
      if (result.hasFailed) {
        throw Exception(
          result.message ?? 'Failed to fetch service types',
        );
      }
      // if (result.status == 200) {
      return result;
      // }
    } catch (e) {
      throw Exception('Failed to Get order details: $e');
    }
  }

  // }
}
