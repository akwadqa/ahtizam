import 'package:ahtizam/src/features/home/domain/models/order/driver_date_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_order_details_model.freezed.dart';
part 'quick_order_details_model.g.dart';

@freezed
class QuickOrderDetailsModel with _$QuickOrderDetailsModel {
  const factory QuickOrderDetailsModel({
   @JsonKey(name: "order_status") required String status,
   @JsonKey(name: "driver_data") required DriverDateModel? driverData,
  }) = _QuickOrderDetailsModel;

  factory QuickOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$QuickOrderDetailsModelFromJson(json);
}
