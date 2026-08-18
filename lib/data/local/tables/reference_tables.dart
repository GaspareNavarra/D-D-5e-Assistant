import 'package:drift/drift.dart';

/// Common "provenance" values shared by every reference table that can hold
/// official SRD content alongside homebrew or fully custom entries.
///
/// Stored as plain text (not a Drift-generated enum) so new sources can be
/// added later without a schema migration.
abstract class DataSource {
  static const official = 'official';
  static const homebrew = 'homebrew';
  static const custom = 'custom';
}

@DataClassName('ClassRow')
class Classes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  /// 'official' | 'homebrew' | 'custom' — see [DataSource].
  TextColumn get source =>
      text().withDefault(const Constant(DataSource.official))();

  IntColumn get hitDie => integer()();
  TextColumn get description => text().nullable()();

  /// Freeform JSON payload for SRD attributes not yet modeled as columns
  /// (spellcasting progression, class features, subclasses, ...). Keeps the
  /// schema stable while the SRD-import feature is still being designed.
  TextColumn get dataJson => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RaceRow')
class Races extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  TextColumn get source =>
      text().withDefault(const Constant(DataSource.official))();

  TextColumn get description => text().nullable()();
  TextColumn get dataJson => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SpellRow')
class Spells extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  /// 'official' | 'homebrew' | 'custom' — required so the spellbook and the
  /// card generator can filter "solo ufficiali" vs "ufficiali+homebrew" vs
  /// "custom" as described in the product brief.
  TextColumn get source =>
      text().withDefault(const Constant(DataSource.official))();

  IntColumn get level => integer()();
  TextColumn get school => text()();
  TextColumn get castingTime => text().nullable()();
  TextColumn get range => text().nullable()();
  TextColumn get duration => text().nullable()();
  BoolColumn get concentration =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get ritual => boolean().withDefault(const Constant(false))();
  TextColumn get description => text().nullable()();

  /// JSON-encoded list of class ids/names that can cast this spell.
  TextColumn get classesJson => text().nullable()();

  TextColumn get dataJson => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ItemRow')
class Items extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  TextColumn get source =>
      text().withDefault(const Constant(DataSource.official))();

  /// e.g. weapon, armor, wondrous item, potion, ...
  TextColumn get type => text()();
  TextColumn get rarity => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get dataJson => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
