import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../local/database.dart';
import '../local/tables/class_race_data_codec.dart';
import '../local/tables/reference_tables.dart';

const _uuid = Uuid();

/// Reads/writes the `races` catalog: official (seeded) and custom
/// entries a player adds from the character-creation wizard.
class RaceRepository {
  final AppDatabase _db;

  const RaceRepository(this._db);

  Stream<List<RaceRow>> watchAll() {
    return (_db.select(_db.races)..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  Future<List<RaceRow>> getAll() {
    return (_db.select(_db.races)..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
  }

  /// Inserts a player-authored race (source = custom) and returns its id.
  Future<String> addCustom({required String name, Map<String, int> abilityBonuses = const {}, String? description}) async {
    final id = _uuid.v4();
    await _db
        .into(_db.races)
        .insert(
          RacesCompanion.insert(
            id: id,
            name: name,
            source: const Value(DataSource.custom),
            description: Value(description),
            dataJson: Value(raceDataJson(abilityBonuses: abilityBonuses)),
          ),
        );
    return id;
  }
}
