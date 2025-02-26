import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/auth_service.dart';
import '../../../data/auth_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() => null;

  Future<void> _authenticate(
    Future<(String authToken, String userId)> Function(AuthRepository authRepo)
        action,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.watch(authRepositoryProvider);
      final userData = await action(authRepo);
      await ref
          .read(userDataProvider.notifier)
          .setData(userData.$1, int.parse(userData.$2));
    });
  }

  Future<void> login(String phone) async {
    await _authenticate((authRepo) => authRepo.login(phone));
  }

  Future<void> signup(
    String email,
    String username,
    String password,
    String confirmPassword,
    String phone,
  ) async {
    await _authenticate(
      (authRepo) =>
          authRepo.signup(email, username, password, confirmPassword, phone),
    );
  }
}
