import 'dart:io';

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
  late final String? personalImage;
  File? _pickedImage;

  // Expose the picked image
  File? get pickedImage => _pickedImage;
  final formKey = GlobalKey<FormState>();

  @override
  FutureOr<ProfileModel> build() async {
    state = AsyncLoading();
    final userData = ref.read(userDataProvider.notifier).userinformation;

    try {
      final data = await ref.watch(profileRepositoryProvider).getProfileData();
      fullNameController = TextEditingController(text: data.fullName);
      emailController = TextEditingController(text: data.email);
      phoneController = TextEditingController(text: data.mobileNumber);
      personalImage = data.profileImage;
      return data;
    } catch (e) {
      // Return a default profile with the basic user data if API fails
      return ProfileModel(
        fullName: userData.fullName,
        email: userData.email,
        mobileNumber: userData.mobileNumber,
        profileImage: null,
      );
    }
  }

  void setPersonalImage(File file) {
    debugPrint('setPersonalImage');
    _pickedImage = file;

    ref.notifyListeners();
    // state = AsyncData(state.value!.copyWith(profileImage: file));
  }

  Future<bool> updateProfile() async {
    state = AsyncLoading();
    // if (!validateAndSave()) return false;

    try {
      final userData = ref.read(userDataProvider.notifier).userinformation;

      final updatedData = await ref
          .watch(profileRepositoryProvider)
          .updateProfileData(ProfileDataParams(
            name: fullNameController.text == userData.fullName
                ? null
                : fullNameController.text,
            phone: phoneController.text == userData.mobileNumber
                ? null
                : phoneController.text,
            // email: emailController.text,
            image: _pickedImage,
          ));
      await ref.read(userDataProvider.notifier).updateBasicUserFields(
            fullName: fullNameController.text,
            email: emailController.text,
            phoneNumber: phoneController.text,
          );
      state = AsyncData(updatedData);
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
