// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsDataModel _$SettingsDataModelFromJson(Map<String, dynamic> json) =>
    _SettingsDataModel(
      privacyPolicy: SettingsServiceDetails.fromJson(
        json['privacy_policy'] as Map<String, dynamic>,
      ),
      howTheAppWorks: SettingsServiceDetails.fromJson(
        json['how_the_app_works'] as Map<String, dynamic>,
      ),
      contactUs: ContactServiceDetails.fromJson(
        json['contact_us'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SettingsDataModelToJson(_SettingsDataModel instance) =>
    <String, dynamic>{
      'privacy_policy': instance.privacyPolicy,
      'how_the_app_works': instance.howTheAppWorks,
      'contact_us': instance.contactUs,
    };

_SettingsServiceDetails _$SettingsServiceDetailsFromJson(
  Map<String, dynamic> json,
) => _SettingsServiceDetails(
  title: json['title'] as String,
  paragraph: json['paragraph'] as String,
);

Map<String, dynamic> _$SettingsServiceDetailsToJson(
  _SettingsServiceDetails instance,
) => <String, dynamic>{
  'title': instance.title,
  'paragraph': instance.paragraph,
};

_ContactServiceDetails _$ContactServiceDetailsFromJson(
  Map<String, dynamic> json,
) => _ContactServiceDetails(
  phone: json['phone'] as String,
  website: json['website'] as String,
  socialMedia: json['social_media'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ContactServiceDetailsToJson(
  _ContactServiceDetails instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'website': instance.website,
  'social_media': instance.socialMedia,
};
