import '../../../core/constants/app_constants.dart';
import 'point_buy.dart';

/// Guessed "key ability" per class — a simplification (some classes
/// legitimately support more than one build), used only to seed the
/// point-buy suggestion below.
///
/// This is a rules-derived heuristic, not the AI-generated build advice
/// described in the product brief for the player-side assistant — that's
/// a separate, later feature (it'll call an actual LLM through
/// `AiProvider`). This exists so the point-buy screen isn't empty of
/// guidance in the meantime.
String classPrimaryAbility(String className) {
  switch (className) {
    case 'Wizard':
      return 'INT';
    case 'Cleric':
      return 'WIS';
    case 'Ranger':
    case 'Rogue':
      return 'DEX';
    case 'Bard':
      return 'CHA';
    default:
      return 'STR';
  }
}

const Map<String, String> abilityRoleReason = {
  'STR': 'attacco e danni in mischia',
  'DEX': 'attacco, CA e furtività',
  'CON': 'i punti ferita',
  'INT': "l'attacco con gli incantesimi",
  'WIS': 'percezione e incantesimi',
  'CHA': 'incantesimi e interazioni sociali',
};

/// A deterministic point-buy suggestion: max the class's primary ability,
/// then CON (survivability matters for every build), then spread
/// whatever's left over the rest — never exceeding the point-buy budget.
Map<String, int> suggestAbilityScores(String className) {
  final primary = classPrimaryAbility(className);
  final scores = defaultScores();

  scores[primary] = pointBuyMax;
  if (primary != 'CON') scores['CON'] = 14;

  final fillOrder = ['WIS', 'DEX', 'INT', 'CHA', 'STR', 'CON'].where((a) => a != primary).toList();

  var spent = totalPointsSpent(scores);
  var guard = 0;
  while (spent < AppConstants.pointBuyBudget && guard < fillOrder.length * 20) {
    final ability = fillOrder[guard % fillOrder.length];
    final current = scores[ability]!;
    if (current < pointBuyMax) {
      final cost = pointBuyCost(current + 1) - pointBuyCost(current);
      if (spent + cost <= AppConstants.pointBuyBudget) {
        scores[ability] = current + 1;
        spent += cost;
      }
    }
    guard++;
  }

  return scores;
}
