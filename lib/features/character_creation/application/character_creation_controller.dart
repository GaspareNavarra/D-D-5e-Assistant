import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/catalog_providers.dart';
import '../domain/point_buy.dart';

part 'character_creation_controller.g.dart';

/// Total wizard steps: Razza e Classe, Point Buy, Incantesimi,
/// Equipaggiamento, Riepilogo.
const int characterCreationStepCount = 5;

class CharacterCreationState {
  final String name;
  final String? raceId;
  final String? classId;
  final Map<String, int> abilityScores;
  final int currentStep;

  const CharacterCreationState({
    required this.name,
    required this.raceId,
    required this.classId,
    required this.abilityScores,
    required this.currentStep,
  });

  bool get canLeaveRaceClassStep => name.trim().isNotEmpty && raceId != null && classId != null;

  int get pointsSpent => totalPointsSpent(abilityScores);
  int get pointsRemaining => AppConstants.pointBuyBudget - pointsSpent;

  CharacterCreationState copyWith({String? name, String? raceId, String? classId, Map<String, int>? abilityScores, int? currentStep}) {
    return CharacterCreationState(
      name: name ?? this.name,
      raceId: raceId ?? this.raceId,
      classId: classId ?? this.classId,
      abilityScores: abilityScores ?? this.abilityScores,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}

/// Holds the in-progress wizard state. autoDispose (the default for
/// `@riverpod` functions/classes without `keepAlive`) so starting a new
/// character later gets a clean slate instead of resuming a half-filled
/// one from a previous visit.
@riverpod
class CharacterCreationController extends _$CharacterCreationController {
  @override
  CharacterCreationState build() {
    return CharacterCreationState(name: '', raceId: null, classId: null, abilityScores: defaultScores(), currentStep: 0);
  }

  void setName(String name) => state = state.copyWith(name: name);

  void selectRace(String raceId) => state = state.copyWith(raceId: raceId);

  void selectClass(String classId) => state = state.copyWith(classId: classId);

  void incrementAbility(String ability) {
    final current = state.abilityScores[ability] ?? pointBuyMin;
    if (current >= pointBuyMax) return;
    final next = {...state.abilityScores, ability: current + 1};
    if (totalPointsSpent(next) > AppConstants.pointBuyBudget) return;
    state = state.copyWith(abilityScores: next);
  }

  void decrementAbility(String ability) {
    final current = state.abilityScores[ability] ?? pointBuyMin;
    if (current <= pointBuyMin) return;
    state = state.copyWith(abilityScores: {...state.abilityScores, ability: current - 1});
  }

  void applyAbilityScores(Map<String, int> scores) => state = state.copyWith(abilityScores: scores);

  void nextStep() {
    if (state.currentStep < characterCreationStepCount - 1) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) state = state.copyWith(currentStep: state.currentStep - 1);
  }

  /// Persists the character. [finalAbilityScores] are point-buy scores
  /// with the racial bonus already folded in — the caller (the summary
  /// step, which already has the resolved race row for display) works
  /// that out, this just writes it.
  Future<String> save(Map<String, int> finalAbilityScores) async {
    final repo = ref.read(characterRepositoryProvider);
    return repo.createLocalCharacter(
      name: state.name.trim(),
      raceId: state.raceId!,
      classId: state.classId!,
      abilityScores: finalAbilityScores,
    );
  }
}
