import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/session_repository.dart';
import 'database_provider.dart';

part 'session_provider.g.dart';

/// App-wide singleton for reading/writing the local onboarding session.
@Riverpod(keepAlive: true)
SessionRepository sessionRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SessionRepository(db);
}
