// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInformationAdapter extends TypeAdapter<UserInformation> {
  @override
  final int typeId = 0;

  @override
  UserInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformation(
      token: fields[0] as String,
      fullName: fields[1] as String,
      mobileNumber: fields[2] as String,
      email: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.mobileNumber)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInformationImpl _$$UserInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInformationImpl(
      token: json['token'] as String,
      fullName: json['full_name'] as String,
      mobileNumber: json['mobile_no'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserInformationImplToJson(
        _$UserInformationImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_name': instance.fullName,
      'mobile_no': instance.mobileNumber,
      'email': instance.email,
    };
