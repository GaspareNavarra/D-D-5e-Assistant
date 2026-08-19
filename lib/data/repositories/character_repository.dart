import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../local/database.dart';
import '../local/tables/character_tables.dart';

const _uuid = Uuid();

/// A [CharacterBaseRow] together with its most relevant
/// [CharacterInstanceRow] (for now, every base has exactly one — the
/// local instance created alongside it — so "most relevant" just means
/// "the only one").
class CharacterSummary {
  final CharacterBaseRow base;
  final CharacterInstanceRow instance;
  final String? raceName;
  final String? className;

  const CharacterSummary({required this.base, required this.instance, this.raceName, this.className});
}

/// Reads/writes [CharacterBases] and [CharacterInstances].
class CharacterRepository {
  final AppDatabase _db;

  const CharacterRepository(this._db);

  /// Creates a character_base plus a single local (campaignId = null)
  /// instance seeded with the point-buy ability scores, and returns the
  /// new base id.
  ///
  /// Deliberately **not** wrapped in `_db.transaction()`: on web, when
  /// the browser doesn't support SharedArrayBuffer (no COOP/COEP
  /// headers — true of a plain `flutter run`/static file server, and
  /// possibly of the eventual Cloudflare Pages deploy unless headers
  /// are configured), drift falls back to `WasmStorageImplementation.
  /// sharedIndexedDb`. Writes made inside `transaction()` under that
  /// fallback report success and are even readable for the rest of the
  /// session, but silently never reach durable IndexedDB storage —
  /// confirmed by hand: they vanish on reload while the exact same
  /// writes made without a transaction wrapper persist correctly. Two
  /// sequential awaited inserts sidestep it; the manual rollback below
  /// keeps the two rows from getting out of sync if the second insert
  /// fails.
  Future<String> createLocalCharacter({
    required String name,
    required String raceId,
    required String classId,
    required Map<String, int> abilityScores,
  }) async {
    final baseId = _uuid.v4();
    final instanceId = _uuid.v4();

    await _db
        .into(_db.characterBases)
        .insert(CharacterBasesCompanion.insert(id: baseId, name: name, raceId: Value(raceId), startingClassId: Value(classId)));

    try {
      await _db
          .into(_db.characterInstances)
          .insert(
            CharacterInstancesCompanion.insert(
              id: instanceId,
              characterBaseId: baseId,
              strength: Value(abilityScores['STR'] ?? 10),
              dexterity: Value(abilityScores['DEX'] ?? 10),
              constitution: Value(abilityScores['CON'] ?? 10),
              intelligence: Value(abilityScores['INT'] ?? 10),
              wisdom: Value(abilityScores['WIS'] ?? 10),
              charisma: Value(abilityScores['CHA'] ?? 10),
            ),
          );
    } catch (_) {
      // No transaction to roll back to — remove the now-orphaned base
      // ourselves so a failed save doesn't leave a half-created
      // character behind.
      await (_db.delete(_db.characterBases)..where((t) => t.id.equals(baseId))).go();
      rethrow;
    }

    return baseId;
  }

  /// Every character base on this device, joined with its (only, for
  /// now) instance and the human-readable race/class names.
  Stream<List<CharacterSummary>> watchAll() {
    final query = _db.select(_db.characterBases).join([
      innerJoin(_db.characterInstances, _db.characterInstances.characterBaseId.equalsExp(_db.characterBases.id)),
      leftOuterJoin(_db.races, _db.races.id.equalsExp(_db.characterBases.raceId)),
      leftOuterJoin(_db.classes, _db.classes.id.equalsExp(_db.characterBases.startingClassId)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return CharacterSummary(
          base: row.readTable(_db.characterBases),
          instance: row.readTable(_db.characterInstances),
          raceName: row.readTableOrNull(_db.races)?.name,
          className: row.readTableOrNull(_db.classes)?.name,
        );
      }).toList();
    });
  }
}
