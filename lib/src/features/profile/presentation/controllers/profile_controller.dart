import 'dart:io';

import 'package:ahtizam/src/features/profile/data/repository/profile_repository.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_data_params.dart';
import 'package:ahtizam/src/features/profile/domain/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/regestration/application/auth_service.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
   TextEditingController? fullNameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;

  String? personalImage;
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

      // Initialize ONCE
      fullNameController ??=
          TextEditingController(text: data.fullName ?? userData.fullName);

      emailController ??=
          TextEditingController(text: data.email ?? userData.email);

      phoneController ??=
          TextEditingController(text: data.mobileNumber ?? userData.mobileNumber);

      personalImage = data.profileImage;

      return data;
    } catch (e) {
      // fallback
      fullNameController ??=
          TextEditingController(text: userData.fullName);

      emailController ??=
          TextEditingController(text: userData.email);

      phoneController ??=
          TextEditingController(text: userData.mobileNumber);

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
            name: fullNameController?.text == userData.fullName
                ? null
                : fullNameController?.text,
            phone: phoneController?.text == userData.mobileNumber
                ? null
                : phoneController?.text,
            // email: emailController.text,
            image: _pickedImage,
          ));
      await ref.read(userDataProvider.notifier).updateBasicUserFields(
            fullName: fullNameController?.text,
            email: emailController?.text,
            phoneNumber: phoneController?.text,
          );
      state = AsyncData(updatedData);
      return true;
    } catch (e) {
      debugPrint('Error updating profile: $e');
      return false;
    }
  }

Future<bool> deleteAccount()async{
  state=AsyncLoading();
  final result = await AsyncValue.guard(() async {
    return await ref.read(profileRepositoryProvider).deleteAccount();
  });

  state = AsyncData(state.value!);

  if (result.hasError) {
    debugPrint("Delete account error: ${result.error}");
    return false;
  }

  return result.value ?? false;

}
  bool validateAndSave() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      return true;
    }
    return false;
  }
}
