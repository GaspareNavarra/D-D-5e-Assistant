import '../../../data/local/database.dart';
import '../../../data/local/tables/class_race_data_codec.dart';

/// One bullet point in the "sinergia" panel: a mechanical observation
/// about how the selected race and class interact.
class SynergyPoint {
  final String text;
  final bool positive;

  const SynergyPoint(this.text, {required this.positive});
}

/// A simplified, rules-derived synergy summary — not the AI-generated
/// build advice the product brief describes for the player-side
/// assistant (that's a later feature); this only looks at saving-throw
/// proficiencies and a guessed casting ability against the race's
/// ability bonuses.
List<SynergyPoint> computeRaceClassSynergy({required ClassRow classRow, required RaceRow raceRow}) {
  final classData = decodeClassData(classRow.dataJson);
  final raceData = decodeRaceData(raceRow.dataJson);
  final points = <SynergyPoint>[];

  final savingThrowBonuses = classData.savingThrows.map((a) => MapEntry(a, raceData.abilityBonuses[a] ?? 0)).where((e) => e.value > 0);

  if (savingThrowBonuses.isEmpty) {
    points.add(SynergyPoint('Nessun bonus razziale sui tiri salvezza chiave di ${classRow.name}', positive: false));
  } else {
    for (final e in savingThrowBonuses) {
      points.add(SynergyPoint('+${e.value} ${e.key} razziale su un tiro salvezza chiave', positive: true));
    }
  }

  if (classData.isCaster) {
    final castingAbility = _guessCastingAbility(classRow.name);
    final bonus = raceData.abilityBonuses[castingAbility] ?? 0;
    if (bonus > 0) {
      points.add(SynergyPoint("+$bonus $castingAbility razziale sull'abilità di lancio", positive: true));
    } else {
      points.add(SynergyPoint("Nessun bonus razziale sull'abilità di lancio ($castingAbility)", positive: false));
    }
  }

  return points;
}

String _guessCastingAbility(String className) {
  switch (className) {
    case 'Wizard':
      return 'INT';
    case 'Cleric':
    case 'Ranger':
    case 'Druid':
      return 'WIS';
    default:
      return 'CHA';
  }
}
