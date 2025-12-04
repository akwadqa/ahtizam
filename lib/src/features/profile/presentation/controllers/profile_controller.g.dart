// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileController)
const profileControllerProvider = ProfileControllerProvider._();

final class ProfileControllerProvider
    extends $AsyncNotifierProvider<ProfileController, ProfileModel> {
  const ProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileControllerHash();

  @$internal
  @override
  ProfileController create() => ProfileController();
}

String _$profileControllerHash() => r'b08c5aed6ba1633b17772d42d4af4b98b0c910cc';

abstract class _$ProfileController extends $AsyncNotifier<ProfileModel> {
  FutureOr<ProfileModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ProfileModel>, ProfileModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileModel>, ProfileModel>,
              AsyncValue<ProfileModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
