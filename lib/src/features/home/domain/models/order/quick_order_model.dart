import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_order_model.freezed.dart';
part 'quick_order_model.g.dart';

@freezed
abstract class QuickOrderModel with _$QuickOrderModel {
  const factory QuickOrderModel({
   @JsonKey(name: "quick_order_id") required String quickOrderId,
   @JsonKey(name: "base_fee") required double baseFee,
   @JsonKey(name: "tax_fee") required double taxFee,
   @JsonKey(name: "discount_cost") required double? discountCost,
   @JsonKey(name: "final_fee") required double finalFee,

  //  distance, duration
   required String eta,

  }) = _QuickOrderModel;

  factory QuickOrderModel.fromJson(Map<String, dynamic> json) =>
      _$QuickOrderModelFromJson(json);
}
