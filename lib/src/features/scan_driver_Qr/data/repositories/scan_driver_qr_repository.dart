
import 'package:ahtizam/src/features/home/domain/models/order/driver_date_model.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/data/datasources/scan_drive_qr_datasource.dart';
import 'package:ahtizam/src/features/scan_driver_Qr/domain/model/driver_info_model.dart';
import 'package:ahtizam/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_driver_qr_repository.g.dart';

@Riverpod(keepAlive: true)
ScanDriverQrRepository scanDriverQrRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return ScanDriverQrRepository(ScanDriveQrDatasource(networkService));
}

class ScanDriverQrRepository {
  final ScanDriveQrDatasource _remoteDataSource;

  ScanDriverQrRepository(this._remoteDataSource);


  Future<DriverInfoModel> fetchByDriverId({
    required String driverId,
  }) async {
    try {
      final result = await _remoteDataSource.fetchByDriverId(driverId);

      if (result.status == 200) {
        return result.data!;
      } else {
        throw Exception('Failed to Fetch This DRIVER ID: ${result.message}');
      } 
    } catch (e) {
      throw Exception('Failed to Fetch This DRIVER ID: $e');
    }
  }

  // }
}
