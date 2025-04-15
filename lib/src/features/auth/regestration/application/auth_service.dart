import 'package:ahtizam/src/configs/hive_configs/hive_boxes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../constants/keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/domain/model/user_information.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async =>
    await SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  String? build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;
    final token = sharedPrefs.getString(Keys.token);
    if (token != null) {
      return sharedPrefs.getString(Keys.token)!;
    }
    return null;
  }

  static const String _userInfo = HiveBoxesName.userInfoBox;
  static UserInformation _defualtUserinfo = UserInformation.empty();

  Box<UserInformation> get _userinfoBox => Hive.box<UserInformation>(_userInfo);

  UserInformation get userinformation =>
      _userinfoBox.get(0) ?? _defualtUserinfo;
  Future<void> setData(String token) async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.setString(Keys.token, token);

    // state = token;
  }

  Future<void> removeData() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.remove(Keys.token);
    debugPrint("TOKEN REMOVED SUCCESSFULLY");
    state = null;
  }

  Future<void> saveUserInfo(UserInformation info) async {
    _defualtUserinfo = info;
    await _userinfoBox.put(0, info);
  }

  UserInformation getUserData() {
    final box = Hive.box<UserInformation>(HiveBoxesName.userInfoBox);
    return box.get(0) ?? UserInformation.empty();
  }

  Future<void> updateBasicUserFields({
    String? fullName,
    String? email,
    String? phoneNumber,
  }) async {
    try {
      final box = Hive.box<UserInformation>(HiveBoxesName.userInfoBox);
      final currentUser = box.get(0);

      if (currentUser == null) return;

      final updatedUser = UserInformation(
        token: currentUser.token,
        fullName: fullName ?? currentUser.fullName,
        email: email ?? currentUser.email,
        mobileNumber: phoneNumber ?? currentUser.mobileNumber,
        // include any other fields your constructor requires here
      );

      await box.put(0, updatedUser);
      _defualtUserinfo = updatedUser;
    } catch (e) {
      debugPrint('Error updating basic user fields: $e');
      rethrow;
    }
  }
}

@riverpod
bool isAuthinticated(Ref ref) {
  return ref.watch(userDataProvider) != null;
}

/// **Check if the app is opened for the first time**
@riverpod
bool isFirstTimeOpeningApp(Ref ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;
  return sharedPrefs.getBool(Keys.firstTime) ??
      true; // Default to true (first time)
}

/// **Mark the app as opened (Not first time anymore)**
Future<void> markAppOpened(WidgetRef ref) async {
  final sharedPrefs = await SharedPreferences.getInstance();
  await sharedPrefs.setBool(Keys.firstTime, false);
}

//////////////////////////////////////////////////////////////

// // Secure storage setup
// const _secureStorage = FlutterSecureStorage();
// const _tokenKey = 'secure_auth_token';

// @Riverpod(keepAlive: true)
// class AuthService extends _$AuthService {
//   late Box<UserInformation> _userBox;
//   late FlutterSecureStorage _secureStorage;

//   @override
//   Future<UserInformation?> build() async {
//     _userBox = Hive.box<UserInformation>(HiveBoxesName.userInfoBox);
//     _secureStorage = const FlutterSecureStorage();
//     return _loadUserData();
//   }

//   Future<UserInformation?> _loadUserData() async {
//     try {
//       // Check secure storage first
//       final token = await _secureStorage.read(key: _tokenKey);
//       if (token == null) return null;

//       // Get user info from Hive
//       final user = _userBox.get(0);
//       if (user?.token == token) return user;

//       // Token mismatch - clear invalid data
//       await _secureStorage.delete(key: _tokenKey);
//       await _userBox.clear();
//       return null;
//     } catch (e) {
//       debugPrint('Error loading user data: $e');
//       return null;
//     }
//   }

//   Future<void> saveAuthData({
//     required String token,
//     required UserInformation userInfo,
//   }) async {
//     try {
//       // Secure storage for token
//       await _secureStorage.write(key: _tokenKey, value: token);
      
//       // Hive for user information
//       await _userBox.put(0, userInfo.copyWith(token: token));
//       state = AsyncData(userInfo);
//     } catch (e) {
//       state = AsyncError(e, StackTrace.current);
//       rethrow;
//     }
//   }

//   Future<void> clearAuthData() async {
//     try {
//       await _secureStorage.delete(key: _tokenKey);
//       await _userBox.clear();
//       state = AsyncData(null);
//     } catch (e) {
//       state = AsyncError(e, StackTrace.current);
//       rethrow;
//     }
//   }

//   Future<void> updateFirstTimeStatus(bool isFirstTime) async {
//     final sharedPrefs = await SharedPreferences.getInstance();
//     await sharedPrefs.setBool(Keys.firstTime, isFirstTime);
//   }

//   Future<bool> checkFirstTimeOpening() async {
//     final sharedPrefs = await SharedPreferences.getInstance();
//     return sharedPrefs.getBool(Keys.firstTime) ?? true;
//   }

//   Future<void> handleFirstTimeFlow() async {
//     final isFirstTime = await checkFirstTimeOpening();
//     if (isFirstTime) {
//       // Perform first-time setup
//       await updateFirstTimeStatus(false);
//     }
//   }

//   Future<void> updateUserInfo({
//     String? fullName,
//     String? email,
//     String? phoneNumber,
//   }) async {
//     final currentUser = state.value;
//     if (currentUser == null) return;

//     final updatedUser = currentUser.copyWith(
//       fullName: fullName,
//       email: email,
//       mobileNumber: phoneNumber,
//     );

//     await _userBox.put(0, updatedUser);
//     state = AsyncData(updatedUser);
//   }
// }

// // Add to UserInformation model
// @HiveType(typeId: HiveTypeIds.userInfoTypId)
// class UserInformation {
//   // ... existing fields ...

//   UserInformation copyWith({
//     String? token,
//     String? fullName,
//     String? email,
//     String? mobileNumber,
//   }) {
//     return UserInformation(
//       token: token ?? this.token,
//       fullName: fullName ?? this.fullName,
//       email: email ?? this.email,
//       mobileNumber: mobileNumber ?? this.mobileNumber,
//     );
//   }
// }