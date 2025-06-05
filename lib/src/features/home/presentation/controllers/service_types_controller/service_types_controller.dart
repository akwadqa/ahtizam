import 'package:ahtizam/src/features/home/domain/models/service_types/service_types_model.dart';
import 'package:ahtizam/src/features/home/presentation/controllers/select_truck_controller.dart';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ahtizam/src/features/home/data/repositories/home_repository.dart';

part 'service_types_controller.g.dart';

@riverpod
class ServiceTypesController extends _$ServiceTypesController {
  @override
  FutureOr<List<ServiceTypesModel>?> build() {
    // No initial request
    return null;
  }

  Future<List<ServiceTypesModel>?> getServiceTypes(BuildContext context) async {
      // Set loading state
     try{
      state = const AsyncLoading();
      
      final repo = ref.read(homeRepositoryProvider);
      final result = await repo.getServiceTypes();

      // Update dependent controller
      // await ref
      //     .read(selectServiceTypeControllerProvider.notifier)
      //     .getServiceTypesDataInformation(context);

      // Update state with new data
      state = AsyncData(result.data);

      return result.data;
    } catch (e, stackTrace) {
      debugPrint("❌ StackTrace: $stackTrace");

      state = AsyncError(e, stackTrace);
    }
  }

}

