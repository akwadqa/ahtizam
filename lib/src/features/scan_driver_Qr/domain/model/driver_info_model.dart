import 'package:freezed_annotation/freezed_annotation.dart';
part 'driver_info_model.freezed.dart';
part 'driver_info_model.g.dart';

@freezed
class DriverInfoModel with _$DriverInfoModel {
  const factory DriverInfoModel({
    @JsonKey(name: "service_type") required String serviceType,
    @JsonKey(name: "qid") required int qid,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "mobile_no") required String driverPhone,
    @JsonKey(name: "profile_image")  String? profileImage,
    required double? rating,
  }) = _DriverInfoModel;

  factory DriverInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DriverInfoModelFromJson(json);
}
