import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../local/database.dart';
import '../local/tables/class_race_data_codec.dart';
import '../local/tables/reference_tables.dart';

const _uuid = Uuid();

/// Reads/writes the `classes` catalog: official (seeded) and custom
/// entries a player adds from the character-creation wizard.
class ClassRepository {
  final AppDatabase _db;

  const ClassRepository(this._db);

  /// Reactive: emits again whenever a row is added/changed.
  Stream<List<ClassRow>> watchAll() {
    return (_db.select(_db.classes)..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();
  }

  Future<List<ClassRow>> getAll() {
    return (_db.select(_db.classes)..orderBy([(t) => OrderingTerm(expression: t.name)])).get();
  }

  /// Inserts a player-authored class (source = custom) and returns its id.
  Future<String> addCustom({
    required String name,
    required int hitDie,
    required List<String> savingThrows,
    required String spellcasting,
    String? description,
  }) async {
    final id = _uuid.v4();
    await _db
        .into(_db.classes)
        .insert(
          ClassesCompanion.insert(
            id: id,
            name: name,
            hitDie: hitDie,
            source: const Value(DataSource.custom),
            description: Value(description),
            dataJson: Value(classDataJson(savingThrows: savingThrows, spellcasting: spellcasting)),
          ),
        );
    return id;
  }
}
