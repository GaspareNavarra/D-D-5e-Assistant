// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Root router. Routes are added feature-by-feature as each one is built.
///
/// Gate: `/login` is only reachable when this device hasn't completed
/// onboarding yet ([SessionRepository.getAuthMode] returns null);
/// everywhere else redirects there until it has. Once a session exists,
/// `/login` (and bare `/`) redirect to `/home` instead. `/showcase` is a
/// dev-only design-system sanity check, not a real screen.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// Root router. Routes are added feature-by-feature as each one is built.
///
/// Gate: `/login` is only reachable when this device hasn't completed
/// onboarding yet ([SessionRepository.getAuthMode] returns null);
/// everywhere else redirects there until it has. Once a session exists,
/// `/login` (and bare `/`) redirect to `/home` instead. `/showcase` is a
/// dev-only design-system sanity check, not a real screen.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Root router. Routes are added feature-by-feature as each one is built.
  ///
  /// Gate: `/login` is only reachable when this device hasn't completed
  /// onboarding yet ([SessionRepository.getAuthMode] returns null);
  /// everywhere else redirects there until it has. Once a session exists,
  /// `/login` (and bare `/`) redirect to `/home` instead. `/showcase` is a
  /// dev-only design-system sanity check, not a real screen.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'4b2e8d20e3dbd19c7140883b7bdbb642a281507d';
