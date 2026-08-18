import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/card_and_notes_tables.dart';
import 'tables/character_tables.dart';
import 'tables/reference_tables.dart';

part 'database.g.dart';

/// The app's single source of truth for everything that isn't campaign
/// state synced through PocketBase. Every user-owned device has its own
/// copy of this database; campaign sync writes straight into it as updates
/// arrive, it never lives only on screen.
@DriftDatabase(
  tables: [
    Classes,
    Races,
    Spells,
    Items,
    CharacterBases,
    CharacterInstances,
    CharacterSpells,
    CharacterInventory,
    GeneratedCards,
    CharacterBuildNotes,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// For tests: pass an in-memory or otherwise custom executor directly.
  AppDatabase.withExecutor(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        // Future schema changes are added as additional `onUpgrade` steps
        // here — keep every past version's migration so an upgrade from any
        // older install still works.
      );
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'dnd_assistant',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
