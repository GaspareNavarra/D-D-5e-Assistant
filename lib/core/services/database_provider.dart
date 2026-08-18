import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/database.dart';

part 'database_provider.g.dart';

/// App-wide singleton for the local Drift database. Kept alive for the
/// whole app lifetime; every feature repository should read this instead
/// of constructing its own [AppDatabase].
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}
