import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

import '../../../../configs/hive_configs/hive_type_ids.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

/// **Hive & Freezed Integrated Model**
@freezed
@HiveType(typeId: HiveTypeIds.userInfoTypId)
class UserInformation with _$UserInformation {
  /// **Factory Constructor**
  factory UserInformation({
    @HiveField(0) required String token,
    @HiveField(1) @JsonKey(name: "full_name") required String fullName,
    @HiveField(2) @JsonKey(name: "mobile_no") required String mobileNumber,
    @HiveField(3) @JsonKey(name: "email") required String email,
  }) = _UserInformation;

  /// **Default Empty Object (If Needed)**
  factory UserInformation.empty() =>
      UserInformation(token: "", fullName: "", mobileNumber: "", email: "");

  /// **Factory Constructor for JSON**
  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);
}
