import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

import '../../../../configs/hive_configs/hive_type_ids.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

/// **Helper Functions to Convert JSON String to Object**
UserInformation UserInformationFromJson(String str) =>
    UserInformation.fromJson(json.decode(str));

String UserInformationToJson(UserInformation data) =>
    json.encode(data.toJson());

/// **Hive & Freezed Integrated Model**
@freezed
@HiveType(typeId: HiveTypeIds.userInfoTypId)
class UserInformation with _$UserInformation {
  /// **Factory Constructor**
  factory UserInformation({
    @HiveField(0) required String ***REMOVED***,
    @HiveField(1) @JsonKey(name: "full_name") required String fullName,
    @HiveField(2) @JsonKey(name: "mobile_no") required String mobileNumber,
  }) = _UserInformation;

  /// **Default Empty Object (If Needed)**
  factory UserInformation.empty() =>
      UserInformation(***REMOVED***: "", fullName: "", mobileNumber: "");

  /// **Factory Constructor for JSON**
  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);
}
