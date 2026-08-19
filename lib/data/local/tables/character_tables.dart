import 'package:drift/drift.dart';

import 'reference_tables.dart';

/// The character's platform-independent identity: name, race, starting
/// class, backstory. Deliberately has no level/HP/inventory — that game
/// state lives per-campaign in [CharacterInstances] so the same base can be
/// played across multiple campaigns without the campaigns interfering with
/// each other.
@DataClassName('CharacterBaseRow')
class CharacterBases extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  /// Nullable FK: a base can point at a catalogued race/class, or leave
  /// these unset and describe a fully homebrew concept via [dataJson].
  TextColumn get raceId => text().nullable().references(Races, #id)();
  TextColumn get startingClassId =>
      text().nullable().references(Classes, #id)();

  TextColumn get backstory => text().nullable()();

  /// Freeform payload for anything the AI build assistant needs to persist
  /// at the character (not instance) level — e.g. the original concept
  /// prompt. Level-by-level build notes have their own table,
  /// [CharacterBuildNotes], since there can be more than one plan revision.
  TextColumn get dataJson => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// One independent play-through of a [CharacterBases] row: its own level,
/// HP, spell slots and inventory. Several instances can reference the same
/// base and evolve independently — that's what lets a character be reused
/// across campaigns.
@DataClassName('CharacterInstanceRow')
class CharacterInstances extends Table {
  TextColumn get id => text()();
  TextColumn get characterBaseId =>
      text().references(CharacterBases, #id)();

  /// Null = a purely local instance, not tied to any DM-hosted campaign
  /// synced via PocketBase.
  TextColumn get campaignId => text().nullable()();
  TextColumn get campaignName => text().nullable()();

  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get currentHp => integer().withDefault(const Constant(0))();
  IntColumn get maxHp => integer().withDefault(const Constant(0))();
  IntColumn get temporaryHp => integer().withDefault(const Constant(0))();
  IntColumn get armorClass => integer().nullable()();
  IntColumn get proficiencyBonus => integer().nullable()();

  /// Ability scores (point-buy total + racial bonus, at creation time).
  /// Instance-level rather than base-level: two instances of the same
  /// character_base level up independently, so their scores can diverge
  /// once Ability Score Improvements start being applied per instance.
  IntColumn get strength => integer().withDefault(const Constant(10))();
  IntColumn get dexterity => integer().withDefault(const Constant(10))();
  IntColumn get constitution => integer().withDefault(const Constant(10))();
  IntColumn get intelligence => integer().withDefault(const Constant(10))();
  IntColumn get wisdom => integer().withDefault(const Constant(10))();
  IntColumn get charisma => integer().withDefault(const Constant(10))();

  /// JSON map of spell-slot level -> {max, used}. Kept flexible until the
  /// character-sheet feature settles on its final shape.
  TextColumn get spellSlotsJson => text().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// Join table: which spells a given character instance knows/has prepared.
@DataClassName('CharacterSpellRow')
class CharacterSpells extends Table {
  TextColumn get id => text()();
  TextColumn get characterInstanceId =>
      text().references(CharacterInstances, #id)();
  TextColumn get spellId => text().references(Spells, #id)();

  BoolColumn get isPrepared =>
      boolean().withDefault(const Constant(false))();

  /// Always-prepared spells granted by class/subclass/race features.
  BoolColumn get isAlwaysPrepared =>
      boolean().withDefault(const Constant(false))();

  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {characterInstanceId, spellId},
      ];
}

/// Join table: a character instance's inventory.
@DataClassName('CharacterInventoryRow')
class CharacterInventory extends Table {
  TextColumn get id => text()();
  TextColumn get characterInstanceId =>
      text().references(CharacterInstances, #id)();
  TextColumn get itemId => text().references(Items, #id)();

  IntColumn get quantity => integer().withDefault(const Constant(1))();
  BoolColumn get isEquipped =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isAttuned =>
      boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
