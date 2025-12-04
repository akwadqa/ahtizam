import 'package:freezed_annotation/freezed_annotation.dart';
part 'driver_details_model.freezed.dart';
part 'driver_details_model.g.dart';

@freezed
abstract class DriverDetails with _$DriverDetails {
  const factory DriverDetails({
    // @JsonKey(name: "assigned_date") required DateTime assignedDate,
    // @JsonKey(name: "assigned_time") required String assignedTime,
    @JsonKey(name: "assigned_driver") required String? assignedDriver,
    @JsonKey(name: "full_name") required String? fullName,
    @JsonKey(name: "phone") required String? driverPhone,
    @JsonKey(name: "profile_image")  String? profileImage,
   @JsonKey(name: "driver_rating")  required double? rating,
  }) = _DriverDetails;

  factory DriverDetails.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsFromJson(json);
}
