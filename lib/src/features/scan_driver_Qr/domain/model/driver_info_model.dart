import 'package:freezed_annotation/freezed_annotation.dart';
part 'driver_info_model.freezed.dart';
part 'driver_info_model.g.dart';

@freezed
abstract class DriverInfoModel with _$DriverInfoModel {
  const factory DriverInfoModel({
    @JsonKey(name: "service_type") required String serviceType,
    @JsonKey(name: "driver_qid") required String qid,
    @JsonKey(name: "driver_full_name") required String fullName,
    @JsonKey(name: "driver_phone_number") required String driverPhone,
    @JsonKey(name: "profile_image")  String? profileImage,
    required double? rating,
  }) = _DriverInfoModel;

  factory DriverInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DriverInfoModelFromJson(json);
}
