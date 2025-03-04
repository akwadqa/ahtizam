import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async =>
    await SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  String? build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;
    final ***REMOVED*** = sharedPrefs.getString(Keys.***REMOVED***);
    // final userId = sharedPrefs.getInt(Keys.userId);
    if (***REMOVED*** != null) {
      return sharedPrefs.getString(Keys.***REMOVED***)!
          // sharedPrefs.getInt(Keys.userId)!
          ;
    }
    return null;
  }

  Future<void> setData(String ***REMOVED***) async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.setString(Keys.***REMOVED***, ***REMOVED***);

    // state = ***REMOVED***;
  }

  Future<void> removeData() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.remove(Keys.***REMOVED***);
    debugPrint("TOKEN REMOVED SUCCESSFULLY");
    // await sharedPrefs.remove(Keys.userId);
    state = null;
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
