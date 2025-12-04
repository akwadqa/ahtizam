// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ratingRepository)
const ratingRepositoryProvider = RatingRepositoryProvider._();

final class RatingRepositoryProvider
    extends
        $FunctionalProvider<
          RatingRepository,
          RatingRepository,
          RatingRepository
        >
    with $Provider<RatingRepository> {
  const RatingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ratingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ratingRepositoryHash();

  @$internal
  @override
  $ProviderElement<RatingRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RatingRepository create(Ref ref) {
    return ratingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RatingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RatingRepository>(value),
    );
  }
}

String _$ratingRepositoryHash() => r'4789645ebc26d6331f76c9f265d146abd4aa0cec';
