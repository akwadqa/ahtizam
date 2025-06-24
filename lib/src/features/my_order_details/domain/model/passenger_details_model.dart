import 'package:freezed_annotation/freezed_annotation.dart';
part 'passenger_details_model.freezed.dart';
part 'passenger_details_model.g.dart';

@freezed
class PassengerDetails with _$PassengerDetails {
  const factory PassengerDetails({
    required String passenger,
    @JsonKey(name: "full_name") required String fullName,

    @JsonKey(name: "phone") required String driverPhone,
    @JsonKey(name: "profile_image")  String? profileImage,
  }) = _PassengerDetails;

  factory PassengerDetails.fromJson(Map<String, dynamic> json) =>
      _$PassengerDetailsFromJson(json);
}
