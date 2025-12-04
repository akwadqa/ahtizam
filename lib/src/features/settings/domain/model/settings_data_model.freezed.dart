// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsDataModel {

@JsonKey(name: 'privacy_policy') SettingsServiceDetails get privacyPolicy;@JsonKey(name: 'how_the_app_works') SettingsServiceDetails get howTheAppWorks;@JsonKey(name: 'contact_us') ContactServiceDetails get contactUs;
/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsDataModelCopyWith<SettingsDataModel> get copyWith => _$SettingsDataModelCopyWithImpl<SettingsDataModel>(this as SettingsDataModel, _$identity);

  /// Serializes this SettingsDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsDataModel&&(identical(other.privacyPolicy, privacyPolicy) || other.privacyPolicy == privacyPolicy)&&(identical(other.howTheAppWorks, howTheAppWorks) || other.howTheAppWorks == howTheAppWorks)&&(identical(other.contactUs, contactUs) || other.contactUs == contactUs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,privacyPolicy,howTheAppWorks,contactUs);

@override
String toString() {
  return 'SettingsDataModel(privacyPolicy: $privacyPolicy, howTheAppWorks: $howTheAppWorks, contactUs: $contactUs)';
}


}

/// @nodoc
abstract mixin class $SettingsDataModelCopyWith<$Res>  {
  factory $SettingsDataModelCopyWith(SettingsDataModel value, $Res Function(SettingsDataModel) _then) = _$SettingsDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'privacy_policy') SettingsServiceDetails privacyPolicy,@JsonKey(name: 'how_the_app_works') SettingsServiceDetails howTheAppWorks,@JsonKey(name: 'contact_us') ContactServiceDetails contactUs
});


$SettingsServiceDetailsCopyWith<$Res> get privacyPolicy;$SettingsServiceDetailsCopyWith<$Res> get howTheAppWorks;$ContactServiceDetailsCopyWith<$Res> get contactUs;

}
/// @nodoc
class _$SettingsDataModelCopyWithImpl<$Res>
    implements $SettingsDataModelCopyWith<$Res> {
  _$SettingsDataModelCopyWithImpl(this._self, this._then);

  final SettingsDataModel _self;
  final $Res Function(SettingsDataModel) _then;

/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? privacyPolicy = null,Object? howTheAppWorks = null,Object? contactUs = null,}) {
  return _then(_self.copyWith(
privacyPolicy: null == privacyPolicy ? _self.privacyPolicy : privacyPolicy // ignore: cast_nullable_to_non_nullable
as SettingsServiceDetails,howTheAppWorks: null == howTheAppWorks ? _self.howTheAppWorks : howTheAppWorks // ignore: cast_nullable_to_non_nullable
as SettingsServiceDetails,contactUs: null == contactUs ? _self.contactUs : contactUs // ignore: cast_nullable_to_non_nullable
as ContactServiceDetails,
  ));
}
/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsServiceDetailsCopyWith<$Res> get privacyPolicy {
  
  return $SettingsServiceDetailsCopyWith<$Res>(_self.privacyPolicy, (value) {
    return _then(_self.copyWith(privacyPolicy: value));
  });
}/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsServiceDetailsCopyWith<$Res> get howTheAppWorks {
  
  return $SettingsServiceDetailsCopyWith<$Res>(_self.howTheAppWorks, (value) {
    return _then(_self.copyWith(howTheAppWorks: value));
  });
}/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactServiceDetailsCopyWith<$Res> get contactUs {
  
  return $ContactServiceDetailsCopyWith<$Res>(_self.contactUs, (value) {
    return _then(_self.copyWith(contactUs: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsDataModel].
extension SettingsDataModelPatterns on SettingsDataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsDataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsDataModel value)  $default,){
final _that = this;
switch (_that) {
case _SettingsDataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsDataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'privacy_policy')  SettingsServiceDetails privacyPolicy, @JsonKey(name: 'how_the_app_works')  SettingsServiceDetails howTheAppWorks, @JsonKey(name: 'contact_us')  ContactServiceDetails contactUs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsDataModel() when $default != null:
return $default(_that.privacyPolicy,_that.howTheAppWorks,_that.contactUs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'privacy_policy')  SettingsServiceDetails privacyPolicy, @JsonKey(name: 'how_the_app_works')  SettingsServiceDetails howTheAppWorks, @JsonKey(name: 'contact_us')  ContactServiceDetails contactUs)  $default,) {final _that = this;
switch (_that) {
case _SettingsDataModel():
return $default(_that.privacyPolicy,_that.howTheAppWorks,_that.contactUs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'privacy_policy')  SettingsServiceDetails privacyPolicy, @JsonKey(name: 'how_the_app_works')  SettingsServiceDetails howTheAppWorks, @JsonKey(name: 'contact_us')  ContactServiceDetails contactUs)?  $default,) {final _that = this;
switch (_that) {
case _SettingsDataModel() when $default != null:
return $default(_that.privacyPolicy,_that.howTheAppWorks,_that.contactUs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingsDataModel implements SettingsDataModel {
  const _SettingsDataModel({@JsonKey(name: 'privacy_policy') required this.privacyPolicy, @JsonKey(name: 'how_the_app_works') required this.howTheAppWorks, @JsonKey(name: 'contact_us') required this.contactUs});
  factory _SettingsDataModel.fromJson(Map<String, dynamic> json) => _$SettingsDataModelFromJson(json);

@override@JsonKey(name: 'privacy_policy') final  SettingsServiceDetails privacyPolicy;
@override@JsonKey(name: 'how_the_app_works') final  SettingsServiceDetails howTheAppWorks;
@override@JsonKey(name: 'contact_us') final  ContactServiceDetails contactUs;

/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsDataModelCopyWith<_SettingsDataModel> get copyWith => __$SettingsDataModelCopyWithImpl<_SettingsDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsDataModel&&(identical(other.privacyPolicy, privacyPolicy) || other.privacyPolicy == privacyPolicy)&&(identical(other.howTheAppWorks, howTheAppWorks) || other.howTheAppWorks == howTheAppWorks)&&(identical(other.contactUs, contactUs) || other.contactUs == contactUs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,privacyPolicy,howTheAppWorks,contactUs);

@override
String toString() {
  return 'SettingsDataModel(privacyPolicy: $privacyPolicy, howTheAppWorks: $howTheAppWorks, contactUs: $contactUs)';
}


}

/// @nodoc
abstract mixin class _$SettingsDataModelCopyWith<$Res> implements $SettingsDataModelCopyWith<$Res> {
  factory _$SettingsDataModelCopyWith(_SettingsDataModel value, $Res Function(_SettingsDataModel) _then) = __$SettingsDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'privacy_policy') SettingsServiceDetails privacyPolicy,@JsonKey(name: 'how_the_app_works') SettingsServiceDetails howTheAppWorks,@JsonKey(name: 'contact_us') ContactServiceDetails contactUs
});


@override $SettingsServiceDetailsCopyWith<$Res> get privacyPolicy;@override $SettingsServiceDetailsCopyWith<$Res> get howTheAppWorks;@override $ContactServiceDetailsCopyWith<$Res> get contactUs;

}
/// @nodoc
class __$SettingsDataModelCopyWithImpl<$Res>
    implements _$SettingsDataModelCopyWith<$Res> {
  __$SettingsDataModelCopyWithImpl(this._self, this._then);

  final _SettingsDataModel _self;
  final $Res Function(_SettingsDataModel) _then;

/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? privacyPolicy = null,Object? howTheAppWorks = null,Object? contactUs = null,}) {
  return _then(_SettingsDataModel(
privacyPolicy: null == privacyPolicy ? _self.privacyPolicy : privacyPolicy // ignore: cast_nullable_to_non_nullable
as SettingsServiceDetails,howTheAppWorks: null == howTheAppWorks ? _self.howTheAppWorks : howTheAppWorks // ignore: cast_nullable_to_non_nullable
as SettingsServiceDetails,contactUs: null == contactUs ? _self.contactUs : contactUs // ignore: cast_nullable_to_non_nullable
as ContactServiceDetails,
  ));
}

/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsServiceDetailsCopyWith<$Res> get privacyPolicy {
  
  return $SettingsServiceDetailsCopyWith<$Res>(_self.privacyPolicy, (value) {
    return _then(_self.copyWith(privacyPolicy: value));
  });
}/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingsServiceDetailsCopyWith<$Res> get howTheAppWorks {
  
  return $SettingsServiceDetailsCopyWith<$Res>(_self.howTheAppWorks, (value) {
    return _then(_self.copyWith(howTheAppWorks: value));
  });
}/// Create a copy of SettingsDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactServiceDetailsCopyWith<$Res> get contactUs {
  
  return $ContactServiceDetailsCopyWith<$Res>(_self.contactUs, (value) {
    return _then(_self.copyWith(contactUs: value));
  });
}
}


/// @nodoc
mixin _$SettingsServiceDetails {

 String get title; String get paragraph;
/// Create a copy of SettingsServiceDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsServiceDetailsCopyWith<SettingsServiceDetails> get copyWith => _$SettingsServiceDetailsCopyWithImpl<SettingsServiceDetails>(this as SettingsServiceDetails, _$identity);

  /// Serializes this SettingsServiceDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsServiceDetails&&(identical(other.title, title) || other.title == title)&&(identical(other.paragraph, paragraph) || other.paragraph == paragraph));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,paragraph);

@override
String toString() {
  return 'SettingsServiceDetails(title: $title, paragraph: $paragraph)';
}


}

/// @nodoc
abstract mixin class $SettingsServiceDetailsCopyWith<$Res>  {
  factory $SettingsServiceDetailsCopyWith(SettingsServiceDetails value, $Res Function(SettingsServiceDetails) _then) = _$SettingsServiceDetailsCopyWithImpl;
@useResult
$Res call({
 String title, String paragraph
});




}
/// @nodoc
class _$SettingsServiceDetailsCopyWithImpl<$Res>
    implements $SettingsServiceDetailsCopyWith<$Res> {
  _$SettingsServiceDetailsCopyWithImpl(this._self, this._then);

  final SettingsServiceDetails _self;
  final $Res Function(SettingsServiceDetails) _then;

/// Create a copy of SettingsServiceDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? paragraph = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,paragraph: null == paragraph ? _self.paragraph : paragraph // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsServiceDetails].
extension SettingsServiceDetailsPatterns on SettingsServiceDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsServiceDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsServiceDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsServiceDetails value)  $default,){
final _that = this;
switch (_that) {
case _SettingsServiceDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsServiceDetails value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsServiceDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String paragraph)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsServiceDetails() when $default != null:
return $default(_that.title,_that.paragraph);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String paragraph)  $default,) {final _that = this;
switch (_that) {
case _SettingsServiceDetails():
return $default(_that.title,_that.paragraph);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String paragraph)?  $default,) {final _that = this;
switch (_that) {
case _SettingsServiceDetails() when $default != null:
return $default(_that.title,_that.paragraph);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingsServiceDetails implements SettingsServiceDetails {
  const _SettingsServiceDetails({required this.title, required this.paragraph});
  factory _SettingsServiceDetails.fromJson(Map<String, dynamic> json) => _$SettingsServiceDetailsFromJson(json);

@override final  String title;
@override final  String paragraph;

/// Create a copy of SettingsServiceDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsServiceDetailsCopyWith<_SettingsServiceDetails> get copyWith => __$SettingsServiceDetailsCopyWithImpl<_SettingsServiceDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsServiceDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsServiceDetails&&(identical(other.title, title) || other.title == title)&&(identical(other.paragraph, paragraph) || other.paragraph == paragraph));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,paragraph);

@override
String toString() {
  return 'SettingsServiceDetails(title: $title, paragraph: $paragraph)';
}


}

/// @nodoc
abstract mixin class _$SettingsServiceDetailsCopyWith<$Res> implements $SettingsServiceDetailsCopyWith<$Res> {
  factory _$SettingsServiceDetailsCopyWith(_SettingsServiceDetails value, $Res Function(_SettingsServiceDetails) _then) = __$SettingsServiceDetailsCopyWithImpl;
@override @useResult
$Res call({
 String title, String paragraph
});




}
/// @nodoc
class __$SettingsServiceDetailsCopyWithImpl<$Res>
    implements _$SettingsServiceDetailsCopyWith<$Res> {
  __$SettingsServiceDetailsCopyWithImpl(this._self, this._then);

  final _SettingsServiceDetails _self;
  final $Res Function(_SettingsServiceDetails) _then;

/// Create a copy of SettingsServiceDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? paragraph = null,}) {
  return _then(_SettingsServiceDetails(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,paragraph: null == paragraph ? _self.paragraph : paragraph // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ContactServiceDetails {

 String get phone; String get website;@JsonKey(name: 'social_media') Map<String, dynamic> get socialMedia;
/// Create a copy of ContactServiceDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactServiceDetailsCopyWith<ContactServiceDetails> get copyWith => _$ContactServiceDetailsCopyWithImpl<ContactServiceDetails>(this as ContactServiceDetails, _$identity);

  /// Serializes this ContactServiceDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactServiceDetails&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&const DeepCollectionEquality().equals(other.socialMedia, socialMedia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,website,const DeepCollectionEquality().hash(socialMedia));

@override
String toString() {
  return 'ContactServiceDetails(phone: $phone, website: $website, socialMedia: $socialMedia)';
}


}

/// @nodoc
abstract mixin class $ContactServiceDetailsCopyWith<$Res>  {
  factory $ContactServiceDetailsCopyWith(ContactServiceDetails value, $Res Function(ContactServiceDetails) _then) = _$ContactServiceDetailsCopyWithImpl;
@useResult
$Res call({
 String phone, String website,@JsonKey(name: 'social_media') Map<String, dynamic> socialMedia
});




}
/// @nodoc
class _$ContactServiceDetailsCopyWithImpl<$Res>
    implements $ContactServiceDetailsCopyWith<$Res> {
  _$ContactServiceDetailsCopyWithImpl(this._self, this._then);

  final ContactServiceDetails _self;
  final $Res Function(ContactServiceDetails) _then;

/// Create a copy of ContactServiceDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? website = null,Object? socialMedia = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,socialMedia: null == socialMedia ? _self.socialMedia : socialMedia // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactServiceDetails].
extension ContactServiceDetailsPatterns on ContactServiceDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactServiceDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactServiceDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactServiceDetails value)  $default,){
final _that = this;
switch (_that) {
case _ContactServiceDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactServiceDetails value)?  $default,){
final _that = this;
switch (_that) {
case _ContactServiceDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone,  String website, @JsonKey(name: 'social_media')  Map<String, dynamic> socialMedia)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactServiceDetails() when $default != null:
return $default(_that.phone,_that.website,_that.socialMedia);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone,  String website, @JsonKey(name: 'social_media')  Map<String, dynamic> socialMedia)  $default,) {final _that = this;
switch (_that) {
case _ContactServiceDetails():
return $default(_that.phone,_that.website,_that.socialMedia);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone,  String website, @JsonKey(name: 'social_media')  Map<String, dynamic> socialMedia)?  $default,) {final _that = this;
switch (_that) {
case _ContactServiceDetails() when $default != null:
return $default(_that.phone,_that.website,_that.socialMedia);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactServiceDetails implements ContactServiceDetails {
  const _ContactServiceDetails({required this.phone, required this.website, @JsonKey(name: 'social_media') required final  Map<String, dynamic> socialMedia}): _socialMedia = socialMedia;
  factory _ContactServiceDetails.fromJson(Map<String, dynamic> json) => _$ContactServiceDetailsFromJson(json);

@override final  String phone;
@override final  String website;
 final  Map<String, dynamic> _socialMedia;
@override@JsonKey(name: 'social_media') Map<String, dynamic> get socialMedia {
  if (_socialMedia is EqualUnmodifiableMapView) return _socialMedia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_socialMedia);
}


/// Create a copy of ContactServiceDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactServiceDetailsCopyWith<_ContactServiceDetails> get copyWith => __$ContactServiceDetailsCopyWithImpl<_ContactServiceDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactServiceDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactServiceDetails&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&const DeepCollectionEquality().equals(other._socialMedia, _socialMedia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,website,const DeepCollectionEquality().hash(_socialMedia));

@override
String toString() {
  return 'ContactServiceDetails(phone: $phone, website: $website, socialMedia: $socialMedia)';
}


}

/// @nodoc
abstract mixin class _$ContactServiceDetailsCopyWith<$Res> implements $ContactServiceDetailsCopyWith<$Res> {
  factory _$ContactServiceDetailsCopyWith(_ContactServiceDetails value, $Res Function(_ContactServiceDetails) _then) = __$ContactServiceDetailsCopyWithImpl;
@override @useResult
$Res call({
 String phone, String website,@JsonKey(name: 'social_media') Map<String, dynamic> socialMedia
});




}
/// @nodoc
class __$ContactServiceDetailsCopyWithImpl<$Res>
    implements _$ContactServiceDetailsCopyWith<$Res> {
  __$ContactServiceDetailsCopyWithImpl(this._self, this._then);

  final _ContactServiceDetails _self;
  final $Res Function(_ContactServiceDetails) _then;

/// Create a copy of ContactServiceDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? website = null,Object? socialMedia = null,}) {
  return _then(_ContactServiceDetails(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,socialMedia: null == socialMedia ? _self._socialMedia : socialMedia // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
