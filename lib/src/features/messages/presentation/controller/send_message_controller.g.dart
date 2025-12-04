// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendMessageController)
const sendMessageControllerProvider = SendMessageControllerProvider._();

final class SendMessageControllerProvider
    extends $AsyncNotifierProvider<SendMessageController, String> {
  const SendMessageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendMessageControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendMessageControllerHash();

  @$internal
  @override
  SendMessageController create() => SendMessageController();
}

String _$sendMessageControllerHash() =>
    r'f9adb60ee43fd99b2ef34f9b300a4efe9daf787a';

abstract class _$SendMessageController extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
