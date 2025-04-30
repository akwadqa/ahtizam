import 'package:ahtizam/src/features/auth/regestration/data/repository/auth_repository.dart';
import 'package:ahtizam/src/features/auth/regestration/domain/entity/login_params.dart';
import 'package:ahtizam/src/features/auth/regestration/domain/entity/signup_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() => null;

  Future<void> _authenticate(
    Future<void> Function(AuthRepository authRepo) action,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.watch(authRepositoryProvider);
      await action(authRepo);
    });
  }

  Future<void> login(String phone) async {
    await _authenticate((authRepo) => authRepo.login(LoginParams(phone: phone)));
  }

  Future<void> signup(
    String email,
    String name,
    String phone,
  ) async {
    await _authenticate(
      (authRepo) => authRepo.signup(SignupParams(email: email, name: name, phone: phone)),
    );
  }
}
