import 'package:drift/drift.dart';

/// Values for [LocalSessions.authMode].
abstract class AuthMode {
  /// User picked "usa senza account" — fully offline-first, no identity.
  static const none = 'none';
  static const email = 'email';
  static const google = 'google';
  static const apple = 'apple';
}

/// Single-row table: whether *this device* has been through onboarding
/// and how. There's deliberately no separate user-accounts table yet —
/// when real email/Google/Apple auth lands, this same row grows a
/// nullable `userId` pointing at the PocketBase user, rather than
/// needing a new table or a migration that moves data around.
///
/// Always read/written through [SessionRepository], which enforces the
/// single-row-ness (see its `_singletonId`).
@DataClassName('LocalSessionRow')
class LocalSessions extends Table {
  TextColumn get id => text()();

  /// 'none' | 'email' | 'google' | 'apple' — see [AuthMode].
  TextColumn get authMode => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
