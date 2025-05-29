import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_order_model.freezed.dart';
part 'quick_order_model.g.dart';

@freezed
class QuickOrderModel with _$QuickOrderModel {
  const factory QuickOrderModel({
   @JsonKey(name: "quick_order_id") required String quickOrderId,
  }) = _QuickOrderModel;

  factory QuickOrderModel.fromJson(Map<String, dynamic> json) =>
      _$QuickOrderModelFromJson(json);
}
