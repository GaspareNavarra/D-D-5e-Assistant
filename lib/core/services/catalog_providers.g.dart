// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(classRepository)
final classRepositoryProvider = ClassRepositoryProvider._();

final class ClassRepositoryProvider
    extends
        $FunctionalProvider<ClassRepository, ClassRepository, ClassRepository>
    with $Provider<ClassRepository> {
  ClassRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'classRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$classRepositoryHash();

  @$internal
  @override
  $ProviderElement<ClassRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClassRepository create(Ref ref) {
    return classRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClassRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClassRepository>(value),
    );
  }
}

String _$classRepositoryHash() => r'099395f447a1f626b17da2cdac1cbc5a0a03c0ad';

@ProviderFor(raceRepository)
final raceRepositoryProvider = RaceRepositoryProvider._();

final class RaceRepositoryProvider
    extends $FunctionalProvider<RaceRepository, RaceRepository, RaceRepository>
    with $Provider<RaceRepository> {
  RaceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'raceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$raceRepositoryHash();

  @$internal
  @override
  $ProviderElement<RaceRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RaceRepository create(Ref ref) {
    return raceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RaceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RaceRepository>(value),
    );
  }
}

String _$raceRepositoryHash() => r'40a73f757bd02d81d5811867b751316e39355336';

@ProviderFor(characterRepository)
final characterRepositoryProvider = CharacterRepositoryProvider._();

final class CharacterRepositoryProvider
    extends
        $FunctionalProvider<
          CharacterRepository,
          CharacterRepository,
          CharacterRepository
        >
    with $Provider<CharacterRepository> {
  CharacterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterRepositoryHash();

  @$internal
  @override
  $ProviderElement<CharacterRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CharacterRepository create(Ref ref) {
    return characterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CharacterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CharacterRepository>(value),
    );
  }
}

String _$characterRepositoryHash() =>
    r'b9dd3d1b05d6c522f48da67a1cfff147fdcf6bf8';

/// Runs the one-time official-content seed. Screens that watch the
/// class/race lists should watch this first so the catalog isn't empty
/// on a first launch — it's `keepAlive`, so it only ever runs once per
/// app session regardless of how many screens watch it.

@ProviderFor(catalogSeed)
final catalogSeedProvider = CatalogSeedProvider._();

/// Runs the one-time official-content seed. Screens that watch the
/// class/race lists should watch this first so the catalog isn't empty
/// on a first launch — it's `keepAlive`, so it only ever runs once per
/// app session regardless of how many screens watch it.

final class CatalogSeedProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Runs the one-time official-content seed. Screens that watch the
  /// class/race lists should watch this first so the catalog isn't empty
  /// on a first launch — it's `keepAlive`, so it only ever runs once per
  /// app session regardless of how many screens watch it.
  CatalogSeedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogSeedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogSeedHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return catalogSeed(ref);
  }
}

String _$catalogSeedHash() => r'1f05bf0154de167311fa27c0c7f3c0175de14e16';
