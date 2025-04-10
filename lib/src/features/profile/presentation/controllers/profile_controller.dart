import 'package:ahtizam/src/features/app/domain/model/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/regestration/application/auth_service.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  final formKey = GlobalKey<FormState>();

  @override
  void build() {
    final userData = ref.read(userDataProvider.notifier).userinformation;

    fullNameController = TextEditingController(text: userData.fullName);
    emailController = TextEditingController(text: userData.email);
    phoneController = TextEditingController(text: userData.mobileNumber);
  }

  Future<bool> updateProfile() async {
    if (!validateAndSave()) return false;

    try {
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
