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

  const ClassData({required this.savingThrows, required this.spellcasting});

  bool get isCaster => spellcasting != 'none';
}

String classDataJson({required List<String> savingThrows, required String spellcasting}) {
  return jsonEncode({'savingThrows': savingThrows, 'spellcasting': spellcasting});
}

ClassData decodeClassData(String? json) {
  if (json == null) return const ClassData(savingThrows: [], spellcasting: 'none');
  final map = jsonDecode(json) as Map<String, dynamic>;
  return ClassData(
    savingThrows: (map['savingThrows'] as List<dynamic>? ?? []).cast<String>(),
    spellcasting: map['spellcasting'] as String? ?? 'none',
  );
}

/// Typed view of a [Races] row's [RaceRow.dataJson].
class RaceData {
  /// Ability abbreviation ('STR'..'CHA') -> bonus.
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
