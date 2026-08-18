import '../local/database.dart';
import '../local/tables/session_table.dart';

/// The [LocalSessions] table only ever holds this one row.
const _singletonId = 'local';

/// Reads/writes the single-row [LocalSessions] table: whether this
/// device has been through onboarding, and how.
class SessionRepository {
  final AppDatabase _db;

  const SessionRepository(this._db);

  /// The current auth mode (see [AuthMode]), or `null` if onboarding
  /// hasn't been completed on this device yet.
  Future<String?> getAuthMode() async {
    final row = await (_db.select(
      _db.localSessions,
    )..where((t) => t.id.equals(_singletonId))).getSingleOrNull();
    return row?.authMode;
  }

  /// Marks onboarding as complete with the given [authMode].
  Future<void> setAuthMode(String authMode) async {
    await _db
        .into(_db.localSessions)
        .insertOnConflictUpdate(LocalSessionsCompanion.insert(id: _singletonId, authMode: authMode));
  }

  /// Forgets the local session (e.g. a future "log out" action).
  Future<void> clear() async {
    await (_db.delete(_db.localSessions)..where((t) => t.id.equals(_singletonId))).go();
  }
}
