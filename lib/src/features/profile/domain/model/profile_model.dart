import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @JsonKey(name: "full_name") required String fullName,
    @JsonKey(name: "mobile_no") required String mobileNumber,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "profile_image") required String? profileImage,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
