import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_data_model.freezed.dart';
part 'settings_data_model.g.dart';

@freezed
abstract class SettingsDataModel with _$SettingsDataModel {
  const factory SettingsDataModel({
    @JsonKey(name: 'privacy_policy')
    required SettingsServiceDetails privacyPolicy,
    @JsonKey(name: 'how_the_app_works')
    required SettingsServiceDetails howTheAppWorks,
    @JsonKey(name: 'contact_us') required ContactServiceDetails contactUs,
  }) = _SettingsDataModel;

  factory SettingsDataModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataModelFromJson(json);
}

@freezed
abstract class SettingsServiceDetails with _$SettingsServiceDetails {
  const factory SettingsServiceDetails({
    required String title,
    required String paragraph,
  }) = _SettingsServiceDetails;

  factory SettingsServiceDetails.fromJson(Map<String, dynamic> json) =>
      _$SettingsServiceDetailsFromJson(json);
}
@freezed
abstract class ContactServiceDetails with _$ContactServiceDetails {
  const factory ContactServiceDetails({
    required String phone,
    required String website,
   @JsonKey(name: 'social_media') required Map<String,dynamic> socialMedia,


  }) = _ContactServiceDetails;

  factory ContactServiceDetails.fromJson(Map<String, dynamic> json) =>
      _$ContactServiceDetailsFromJson(json);
}
