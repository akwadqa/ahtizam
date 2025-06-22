import 'package:freezed_annotation/freezed_annotation.dart';
part 'driver_details_model.freezed.dart';
part 'driver_details_model.g.dart';

@freezed
class DriverDetails with _$DriverDetails {
  const factory DriverDetails({
    @JsonKey(name: "assigned_date") required DateTime assignedDate,
    @JsonKey(name: "assigned_time") required String assignedTime,
    @JsonKey(name: "assigned_driver") required String assignedDriver,
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "driver_phone") required String driverPhone,
    @JsonKey(name: "profile_image")  String? profileImage,
    required int rating,
  }) = _DriverDetails;

  factory DriverDetails.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsFromJson(json);
}
