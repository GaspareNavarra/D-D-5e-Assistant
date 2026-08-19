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
    case 'Mago':
      return 'INT';
    case 'Chierico':
    case 'Druido':
      return 'SAG';
    case 'Ranger':
    case 'Ladro':
    case 'Monaco':
      return 'DES';
    case 'Bardo':
    case 'Stregone':
    case 'Warlock':
      return 'CAR';
    default:
      return 'FOR';
  }
}

const Map<String, String> abilityRoleReason = {
  'FOR': 'attacco e danni in mischia',
  'DES': 'attacco, CA e furtività',
  'COS': 'i punti ferita',
  'INT': "l'attacco con gli incantesimi",
  'SAG': 'percezione e incantesimi',
  'CAR': 'incantesimi e interazioni sociali',
};

/// A deterministic point-buy suggestion: max the class's primary ability,
/// then COS (survivability matters for every build), then spread
/// whatever's left over the rest — never exceeding the point-buy budget.
Map<String, int> suggestAbilityScores(String className) {
  final primary = classPrimaryAbility(className);
  final scores = defaultScores();

  scores[primary] = pointBuyMax;
  if (primary != 'COS') scores['COS'] = 14;

  final fillOrder = ['SAG', 'DES', 'INT', 'CAR', 'FOR', 'COS'].where((a) => a != primary).toList();

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
