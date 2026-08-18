/// Abstraction over whichever LLM backend powers the AI assistant.
///
/// The client calls the provider directly — there is no proxy backend —
/// using a user-supplied API key kept in secure storage. The default
/// implementation (added when the AI-assistant features are built) talks
/// to Google's Gemini API free tier; swapping to a different provider
/// means implementing this interface, not touching any caller.
abstract class AiProvider {
  /// Player-side: turns a free-form concept (e.g. "un personaggio anime")
  /// into a level-appropriate build plan. The result seeds a character
  /// sheet already at [BuildPlanRequest.targetLevel] plus persistent
  /// leveling notes attached to the character_base.
  Future<BuildPlanResult> generateBuildPlan(BuildPlanRequest request);

  /// DM-side: generates a contextual NPC on demand.
  Future<NpcResult> generateNpc(NpcRequest request);
}

class BuildPlanRequest {
  final String concept;
  final int targetLevel;
  final String? classId;
  final String? raceId;

  const BuildPlanRequest({
    required this.concept,
    required this.targetLevel,
    this.classId,
    this.raceId,
  });
}

/// [buildPlanJson] and [levelingNotes] map directly onto the
/// `character_build_notes` table columns of the same name.
class BuildPlanResult {
  final String buildPlanJson;
  final String levelingNotes;

  const BuildPlanResult({
    required this.buildPlanJson,
    required this.levelingNotes,
  });
}

class NpcRequest {
  final String context;
  final String? role;

  const NpcRequest({required this.context, this.role});
}

class NpcResult {
  final String name;
  final String description;

  /// Freeform JSON payload (stats, hooks, ...) left up to the DM feature
  /// to interpret.
  final String dataJson;

  const NpcResult({
    required this.name,
    required this.description,
    required this.dataJson,
  });
}
