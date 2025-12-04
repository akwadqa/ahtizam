import 'package:ahtizam/src/features/home/domain/models/order/driver_quick_order_model.dart';
import 'package:ahtizam/src/features/home/domain/models/order/price_offer/driver_offer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_order_details_model.freezed.dart';
part 'quick_order_details_model.g.dart';

@freezed
abstract class QuickOrderDetailsModel with _$QuickOrderDetailsModel {
  const factory QuickOrderDetailsModel({
   @JsonKey(name: "order_status") required String status,
   @JsonKey(name: "driver_data") required DriverQuickOrderModel? driverData,
   @JsonKey(name: "offers") required List<DriverOfferModel>? offers,
  }) = _QuickOrderDetailsModel;

  factory QuickOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$QuickOrderDetailsModelFromJson(json);
}
