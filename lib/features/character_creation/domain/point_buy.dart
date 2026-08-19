/// D&D 5e standard point-buy rules: every ability starts at 8 (cost 0)
/// and can be raised to 15 within a 27-point budget (see
/// [AppConstants.pointBuyBudget] for the budget itself — this file only
/// knows the cost curve).
library;

const List<String> abilityOrder = ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'];

const Map<String, String> abilityLabels = {
  'STR': 'Forza',
  'DEX': 'Destrezza',
  'CON': 'Costituzione',
  'INT': 'Intelligenza',
  'WIS': 'Saggezza',
  'CHA': 'Carisma',
};

const int pointBuyMin = 8;
const int pointBuyMax = 15;

const Map<int, int> _costTable = {8: 0, 9: 1, 10: 2, 11: 3, 12: 4, 13: 5, 14: 7, 15: 9};

/// Point-buy cost of raising a single ability to [score].
int pointBuyCost(int score) => _costTable[score] ?? (score < pointBuyMin ? 0 : 9);

/// Total points spent across all six scores.
int totalPointsSpent(Map<String, int> scores) {
  return abilityOrder.fold(0, (sum, ability) => sum + pointBuyCost(scores[ability] ?? pointBuyMin));
}

/// The default all-8s starting spread.
Map<String, int> defaultScores() => {for (final a in abilityOrder) a: pointBuyMin};
