import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_types_model.freezed.dart';
part 'service_types_model.g.dart';

@freezed
class ServiceTypesModel with _$ServiceTypesModel {

  factory ServiceTypesModel({
   @JsonKey(name: "service_id") required String serviceId,
   @JsonKey(name: "service_item") required String serviceItem,
   @JsonKey(name: "vehicles_size") required String vehiclesSize,
   @JsonKey(name: "vehicle_capacity") required String vehicleCapacity,
   @JsonKey(name: "service_cost_per_km") required double serviceCostPerKm,


  }) = _ServiceTypesModel;

  factory ServiceTypesModel.fromJson(Map<String, dynamic> json) => _$ServiceTypesModelFromJson(json);
}