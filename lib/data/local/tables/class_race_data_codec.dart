import 'dart:convert';

/// Encodes/decodes the `dataJson` payload on [Classes] and [Races] rows.
///
/// These tables intentionally don't have dedicated columns for every SRD
/// attribute (see their doc comments) — saving throws, spellcasting and
/// racial ability bonuses live in this freeform JSON instead, so the
/// character-creation wizard has something typed to work with without
/// forcing a schema migration for every new attribute SRD import turns
/// out to need.

/// Typed view of a [Classes] row's [ClassRow.dataJson].
class ClassData {
  final List<String> savingThrows;

  /// 'none' | 'partial' | 'full'.
  final String spellcasting;

  /// How many skills the player picks at creation.
  final int skillChoices;

  const ClassData({required this.savingThrows, required this.spellcasting, this.skillChoices = 2});

  bool get isCaster => spellcasting != 'none';

  /// The level spells become available: 1 for full casters, 2 for
  /// partial (Ranger/Paladin-style) casters, null for non-casters.
  int? get spellcastingFromLevel => switch (spellcasting) {
    'full' => 1,
    'partial' => 2,
    _ => null,
  };
}

String classDataJson({required List<String> savingThrows, required String spellcasting, int skillChoices = 2}) {
  return jsonEncode({'savingThrows': savingThrows, 'spellcasting': spellcasting, 'skillChoices': skillChoices});
}

ClassData decodeClassData(String? json) {
  if (json == null) return const ClassData(savingThrows: [], spellcasting: 'none');
  final map = jsonDecode(json) as Map<String, dynamic>;
  return ClassData(
    savingThrows: (map['savingThrows'] as List<dynamic>? ?? []).cast<String>(),
    spellcasting: map['spellcasting'] as String? ?? 'none',
    skillChoices: map['skillChoices'] as int? ?? 2,
  );
}

/// Typed view of a [Races] row's [RaceRow.dataJson].
class RaceData {
  /// Ability abbreviation ('FOR'..'CAR', Italian) -> bonus.
  final Map<String, int> abilityBonuses;

  const RaceData({required this.abilityBonuses});
}

String raceDataJson({required Map<String, int> abilityBonuses}) {
  return jsonEncode({'abilityBonuses': abilityBonuses});
}

RaceData decodeRaceData(String? json) {
  if (json == null) return const RaceData(abilityBonuses: {});
  final map = jsonDecode(json) as Map<String, dynamic>;
  final bonuses = (map['abilityBonuses'] as Map<String, dynamic>? ?? {}).map((k, v) => MapEntry(k, v as int));
  return RaceData(abilityBonuses: bonuses);
}
