// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ProfileDataParams {
  final File? image;
  final String? name;
  final String? phone;
  final String? email;

  const ProfileDataParams({
    this.image,
    this.name,
    this.email,
    this.phone,
  });



  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (phone != null) data['mobile_no'] = phone;
    if (email != null) data['email'] = email;

    if (image != null) {
      if (image!.path != '') {
        data['profile_picture_file'] = MultipartFile.fromFileSync(
          image!.path,
          filename: image!.path.split('/').last,
        );
      }
    }
    debugPrint(data.values.toString());
    return data;
  }

  bool get stringify => true;
}
