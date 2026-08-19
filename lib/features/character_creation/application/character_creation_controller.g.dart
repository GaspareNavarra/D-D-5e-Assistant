// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_creation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the in-progress wizard state. autoDispose (the default for
/// `@riverpod` functions/classes without `keepAlive`) so starting a new
/// character later gets a clean slate instead of resuming a half-filled
/// one from a previous visit.

@ProviderFor(CharacterCreationController)
final characterCreationControllerProvider =
    CharacterCreationControllerProvider._();

/// Holds the in-progress wizard state. autoDispose (the default for
/// `@riverpod` functions/classes without `keepAlive`) so starting a new
/// character later gets a clean slate instead of resuming a half-filled
/// one from a previous visit.
final class CharacterCreationControllerProvider
    extends
        $NotifierProvider<CharacterCreationController, CharacterCreationState> {
  /// Holds the in-progress wizard state. autoDispose (the default for
  /// `@riverpod` functions/classes without `keepAlive`) so starting a new
  /// character later gets a clean slate instead of resuming a half-filled
  /// one from a previous visit.
  CharacterCreationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterCreationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterCreationControllerHash();

  @$internal
  @override
  CharacterCreationController create() => CharacterCreationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CharacterCreationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CharacterCreationState>(value),
    );
  }
}

String _$characterCreationControllerHash() =>
    r'cd0a30b32b11fe5c475d42e4975bbb44f0385d8d';

/// Holds the in-progress wizard state. autoDispose (the default for
/// `@riverpod` functions/classes without `keepAlive`) so starting a new
/// character later gets a clean slate instead of resuming a half-filled
/// one from a previous visit.

abstract class _$CharacterCreationController
    extends $Notifier<CharacterCreationState> {
  CharacterCreationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<CharacterCreationState, CharacterCreationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CharacterCreationState, CharacterCreationState>,
              CharacterCreationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
