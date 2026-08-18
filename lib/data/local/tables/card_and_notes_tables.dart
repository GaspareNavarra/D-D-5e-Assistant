import 'package:drift/drift.dart';

import 'character_tables.dart';

/// Values for [GeneratedCards.cardType].
abstract class CardType {
  static const spell = 'spell';
  static const item = 'item';
}

/// A cached, already-rendered spell/item card, so the card generator never
/// has to regenerate the same card twice. Cards are kept in a library and
/// only regenerated when their source data or the visual template changes.
@DataClassName('GeneratedCardRow')
class GeneratedCards extends Table {
  TextColumn get id => text()();

  /// 'spell' | 'item' — see [CardType].
  TextColumn get cardType => text()();

  /// id of the row in the `spells` or `items` table this card renders.
  TextColumn get refId => text()();

  /// Bumped whenever the visual template/design changes, so cards cached
  /// under an older template can be detected and regenerated on demand.
  TextColumn get templateVersion => text().nullable()();

  TextColumn get pdfPath => text().nullable()();
  TextColumn get imagePath => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// AI-assisted build plan and persistent leveling notes for a character.
///
/// Deliberately linked to [CharacterBases], not [CharacterInstances]: the
/// build plan describes the character itself, and must stay attached to it
/// even as it's played across several independent campaign instances.
@DataClassName('CharacterBuildNoteRow')
class CharacterBuildNotes extends Table {
  TextColumn get id => text()();
  TextColumn get characterBaseId =>
      text().references(CharacterBases, #id)();

  /// The original free-form concept prompt (e.g. "un personaggio anime").
  TextColumn get concept => text().nullable()();

  /// Structured level-by-level plan produced by the AI assistant.
  TextColumn get buildPlanJson => text().nullable()();

  /// Freeform persistent notes the player/AI keep appending to as the
  /// character levels up.
  TextColumn get levelingNotes => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
