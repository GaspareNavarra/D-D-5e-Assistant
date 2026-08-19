import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/catalog_seed.dart';
import '../../data/local/database.dart';
import '../../data/repositories/character_repository.dart';
import '../../data/repositories/class_repository.dart';
import '../../data/repositories/race_repository.dart';
import 'database_provider.dart';

part 'catalog_providers.g.dart';

@Riverpod(keepAlive: true)
ClassRepository classRepository(Ref ref) {
  return ClassRepository(ref.watch(appDatabaseProvider));
}

@Riverpod(keepAlive: true)
RaceRepository raceRepository(Ref ref) {
  return RaceRepository(ref.watch(appDatabaseProvider));
}

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(Ref ref) {
  return CharacterRepository(ref.watch(appDatabaseProvider));
}

/// Runs the one-time official-content seed. Screens that watch the
/// class/race lists should watch this first so the catalog isn't empty
/// on a first launch — it's `keepAlive`, so it only ever runs once per
/// app session regardless of how many screens watch it.
@Riverpod(keepAlive: true)
Future<void> catalogSeed(Ref ref) {
  return seedCatalogIfEmpty(ref.watch(appDatabaseProvider));
}

// The three providers below are hand-written rather than `@riverpod`
// codegen: riverpod_generator's type-to-source step throws
// InvalidTypeException on Drift's generated row classes (they implement
// `Insertable<T>` with a self-referential type parameter, which it
// can't re-emit as source). Plain `StreamProvider` sidesteps that.

/// Reactive class list. Drift's `.watch()` re-emits automatically once
/// [catalogSeedProvider]'s inserts land, so there's no need to
/// explicitly sequence after it — just a possible empty first frame.
final classesListProvider = StreamProvider<List<ClassRow>>((ref) {
  return ref.watch(classRepositoryProvider).watchAll();
});

final racesListProvider = StreamProvider<List<RaceRow>>((ref) {
  return ref.watch(raceRepositoryProvider).watchAll();
});

/// Every locally-created character, reactive (updates the moment the
/// creation wizard saves a new one).
final charactersListProvider = StreamProvider<List<CharacterSummary>>((ref) {
  return ref.watch(characterRepositoryProvider).watchAll();
});
