import 'dart:io';

import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:ahtizam/src/features/profile/data/repository/profile_repository.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_data_params.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/regestration/application/auth_service.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final File? profileImage;
  final formKey = GlobalKey<FormState>();

  @override
  FutureOr<ProfileModel> build() {
    final userData = ref.read(userDataProvider.notifier).userinformation;

    fullNameController = TextEditingController(text: userData.fullName);
    emailController = TextEditingController(text: userData.email);
    phoneController = TextEditingController(text: userData.mobileNumber);
    return ref.watch(profileRepositoryProvider).getProfileData();
  }

  void setPersonalImage(File file) {
    debugPrint('setPersonalImage');
    profileImage=file;
    // state = AsyncData(state.value!.copyWith(profileImage: file));
  }
  
  Future<bool> updateProfile() async {
    if (!validateAndSave()) return false;

    try {
      await ref
          .watch(profileRepositoryProvider)
          .updateProfileData(ProfileDataParams(
            name: fullNameController.text,
            phone: phoneController.text,
            // email: emailController.text,
            image: profileImage,
          ));
      await ref.read(userDataProvider.notifier).updateBasicUserFields(
            fullName: fullNameController.text,
            email: emailController.text,
            phoneNumber: phoneController.text,
          );

      return true;
    } catch (e) {
      debugPrint('Error updating profile: $e');
      return false;
    }
  }

  bool validateAndSave() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      return true;
    }
    return false;
  }
}
