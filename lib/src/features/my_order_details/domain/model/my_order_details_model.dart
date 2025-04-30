import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_order_details_model.freezed.dart';
part 'my_order_details_model.g.dart';

@freezed
class MyOrderDetailsModel with _$MyOrderDetailsModel {
  const factory MyOrderDetailsModel({
    required String driverImage,
    required String driverName,
    required String driverRating,
    required String vehicleType,
    required String vehicleId,
    required String orderStart,
    required String orderNumber,
    required String orderEnd,
    required String orderTimeStart,
    required String orderTimeEnd,
    required String date,
    required double price,
    required String paymentMethod,
  }) = _MyOrderDetailsModel;

  factory MyOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MyOrderDetailsModelFromJson(json);
}
