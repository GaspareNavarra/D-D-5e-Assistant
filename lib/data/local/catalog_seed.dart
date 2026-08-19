import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';
import 'tables/class_race_data_codec.dart';
import 'tables/reference_tables.dart';

const _uuid = Uuid();

/// Inserts a small curated set of SRD classes/races the first time the
/// app runs, so the character-creation wizard isn't empty before the
/// real SRD-import feature exists. Idempotent: no-ops if either table
/// already has rows (including if the user has since added custom ones
/// alongside them), so this never overwrites anything.
Future<void> seedCatalogIfEmpty(AppDatabase db) async {
  final hasClasses = await (db.select(db.classes)..limit(1)).get();
  if (hasClasses.isEmpty) {
    await db.batch((batch) {
      batch.insertAll(db.classes, [
        _class('Fighter', hitDie: 10, savingThrows: ['STR', 'CON'], spellcasting: 'none'),
        _class('Wizard', hitDie: 6, savingThrows: ['INT', 'WIS'], spellcasting: 'full'),
        _class('Cleric', hitDie: 8, savingThrows: ['WIS', 'CHA'], spellcasting: 'full'),
        _class('Rogue', hitDie: 8, savingThrows: ['DEX', 'INT'], spellcasting: 'none'),
        _class('Bard', hitDie: 8, savingThrows: ['DEX', 'CHA'], spellcasting: 'full'),
        _class('Barbarian', hitDie: 12, savingThrows: ['STR', 'CON'], spellcasting: 'none'),
        _class('Ranger', hitDie: 10, savingThrows: ['STR', 'DEX'], spellcasting: 'partial'),
        _class('Paladin', hitDie: 10, savingThrows: ['WIS', 'CHA'], spellcasting: 'partial'),
      ]);
    });
  }

  final hasRaces = await (db.select(db.races)..limit(1)).get();
  if (hasRaces.isEmpty) {
    await db.batch((batch) {
      batch.insertAll(db.races, [
        _race('Human', bonuses: {'STR': 1, 'DEX': 1, 'CON': 1, 'INT': 1, 'WIS': 1, 'CHA': 1}),
        _race('Elf (Wood)', bonuses: {'DEX': 2, 'WIS': 1}),
        _race('Elf (High)', bonuses: {'DEX': 2, 'INT': 1}),
        _race('Dwarf (Hill)', bonuses: {'CON': 2, 'WIS': 1}),
        _race('Dwarf (Mountain)', bonuses: {'CON': 2, 'STR': 2}),
        _race('Halfling (Lightfoot)', bonuses: {'DEX': 2, 'CHA': 1}),
        _race('Half-Elf', bonuses: {'CHA': 2}),
        _race('Tiefling', bonuses: {'INT': 1, 'CHA': 2}),
      ]);
    });
  }
}

ClassesCompanion _class(String name, {required int hitDie, required List<String> savingThrows, required String spellcasting}) {
  return ClassesCompanion.insert(
    id: _uuid.v4(),
    name: name,
    hitDie: hitDie,
    source: const Value(DataSource.official),
    dataJson: Value(classDataJson(savingThrows: savingThrows, spellcasting: spellcasting)),
  );
}

RacesCompanion _race(String name, {required Map<String, int> bonuses}) {
  return RacesCompanion.insert(
    id: _uuid.v4(),
    name: name,
    source: const Value(DataSource.official),
    dataJson: Value(raceDataJson(abilityBonuses: bonuses)),
  );
}
