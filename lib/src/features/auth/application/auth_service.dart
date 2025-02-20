import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async =>
    await SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  (String, int)? build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;
    final ***REMOVED*** = sharedPrefs.getString(Keys.***REMOVED***);
    final userId = sharedPrefs.getInt(Keys.userId);
    if (***REMOVED*** != null && userId != null) {
      return (
        sharedPrefs.getString(Keys.***REMOVED***)!,
        sharedPrefs.getInt(Keys.userId)!
      );
    }
    return null;
  }

  Future<void> setData(String ***REMOVED***, int userId) async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.setString(Keys.***REMOVED***, ***REMOVED***);
    await sharedPrefs.setInt(Keys.userId, userId);

    state = (***REMOVED***, userId);
  }

  Future<void> removeData() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.remove(Keys.***REMOVED***);
    await sharedPrefs.remove(Keys.userId);
    state = null;
  }
}

@riverpod
bool isAuthinticated(Ref ref) {
  return ref.watch(userDataProvider) != null;
}
