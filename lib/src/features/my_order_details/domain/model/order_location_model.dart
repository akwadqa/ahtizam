import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_location_model.freezed.dart';
part 'order_location_model.g.dart';
@freezed
class OrderLocationModel with _$OrderLocationModel {
    const factory OrderLocationModel({
        required double latitude,
        required double longitude,
        required String address,
    }) = _OrderLocationModel;

    factory OrderLocationModel.fromJson(Map<String, dynamic> json) => _$OrderLocationModelFromJson(json);
}
