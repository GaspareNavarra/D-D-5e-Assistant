import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';
import 'tables/class_race_data_codec.dart';
import 'tables/reference_tables.dart';

const _uuid = Uuid();

/// Inserts a small curated set of SRD classes/races the first time the
/// app runs, so the character-creation wizard isn't empty before the
/// real SRD-import feature exists. Idempotent: no-ops if either table
/// already has rows (including if the user has since added custom ones
/// alongside them), so this never overwrites anything.
Future<void> seedCatalogIfEmpty(AppDatabase db) async {
  final hasClasses = await (db.select(db.classes)..limit(1)).get();
  if (hasClasses.isEmpty) {
    await db.batch((batch) {
      batch.insertAll(db.classes, [
        _class(
          'Barbarian',
          hitDie: 12,
          savingThrows: ['STR', 'CON'],
          spellcasting: 'none',
          skillChoices: 2,
          description:
              'Guerriero primordiale che canalizza la furia in combattimento: alta resistenza, pochi fronzoli '
              'tattici. Buona scelta per chi vuole restare sempre in prima linea.',
        ),
        _class(
          'Bard',
          hitDie: 8,
          savingThrows: ['DEX', 'CHA'],
          spellcasting: 'full',
          skillChoices: 3,
          description:
              'Artista itinerante che intreccia magia e carisma: pochi incantesimi ma versatili, ottimo supporto '
              'al gruppo grazie a ispirazione ed effetti sociali.',
        ),
        _class(
          'Cleric',
          hitDie: 8,
          savingThrows: ['WIS', 'CHA'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              'Tramite della propria divinità: cura, protegge e può comunque reggere il confronto in mischia. '
              'Buona scelta per chi vuole un ruolo di supporto affidabile.',
        ),
        _class(
          'Fighter',
          hitDie: 10,
          savingThrows: ['STR', 'CON'],
          spellcasting: 'none',
          skillChoices: 2,
          description:
              'Combattente versatile e diretto: nessun incantesimo da gestire, solo tattica e acciaio. Ottimo '
              'primo personaggio per chi vuole concentrarsi sul combattimento.',
        ),
        _class(
          'Paladin',
          hitDie: 10,
          savingThrows: ['WIS', 'CHA'],
          spellcasting: 'partial',
          skillChoices: 2,
          description:
              'Guerriero sacro legato a un giuramento: mischia solida abbinata a incantesimi di supporto e '
              'protezione. Buon equilibrio tra potenza e resistenza.',
        ),
        _class(
          'Ranger',
          hitDie: 10,
          savingThrows: ['STR', 'DEX'],
          spellcasting: 'partial',
          skillChoices: 3,
          description:
              'Cacciatore dei confini: combatte a distanza, si muove senza lasciare traccia e conosce pochi '
              'incantesimi di natura. Buona scelta come primo personaggio: poche risorse da gestire a ogni turno.',
        ),
        _class(
          'Rogue',
          hitDie: 8,
          savingThrows: ['DEX', 'INT'],
          spellcasting: 'none',
          skillChoices: 4,
          description:
              'Specialista della furtività e della precisione: colpisce dove fa più male e si tira fuori dai '
              'guai con abilità. Nessun incantesimo, molte opzioni non in combattimento.',
        ),
        _class(
          'Wizard',
          hitDie: 6,
          savingThrows: ['INT', 'WIS'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              'Studioso della magia arcana: il ventaglio di incantesimi più ampio del gioco, ma fragile in '
              'mischia. Richiede più attenzione nella gestione delle risorse.',
        ),
      ]);
    });
  }

  final hasRaces = await (db.select(db.races)..limit(1)).get();
  if (hasRaces.isEmpty) {
    await db.batch((batch) {
      batch.insertAll(db.races, [
        _race(
          'Human',
          bonuses: {'STR': 1, 'DEX': 1, 'CON': 1, 'INT': 1, 'WIS': 1, 'CHA': 1},
          description:
              'Versatili e adattabili: un piccolo bonus a tutte le caratteristiche, nessuna specializzazione '
              'marcata. Ottima scelta se non vuoi vincoli sulla build.',
        ),
        _race(
          'Elf (Wood)',
          bonuses: {'DEX': 2, 'WIS': 1},
          description:
              'Elfo dei boschi, veloce e furtivo: bonus a Destrezza e Saggezza, affinità con la natura. '
              'Sinergizza bene con classi di mischia leggera o incantatori naturali.',
        ),
        _race(
          'Elf (High)',
          bonuses: {'DEX': 2, 'INT': 1},
          description:
              'Elfo colto e agile: bonus a Destrezza e Intelligenza, un trucchetto arcano innato. Sinergizza '
              "bene con classi che lanciano incantesimi con l'Intelligenza.",
        ),
        _race(
          'Dwarf (Hill)',
          bonuses: {'CON': 2, 'WIS': 1},
          description:
              'Nano resistente e saggio: bonus a Costituzione e Saggezza, resistenza al veleno. Sinergizza bene '
              'con classi che si affidano alla Saggezza.',
        ),
        _race(
          'Dwarf (Mountain)',
          bonuses: {'CON': 2, 'STR': 2},
          description:
              'Nano forgiato per la battaglia: forte bonus a Costituzione e Forza, competenza con armature. '
              'Ottimo per build di mischia pesante.',
        ),
        _race(
          'Halfling (Lightfoot)',
          bonuses: {'DEX': 2, 'CHA': 1},
          description:
              'Piccoli, fortunati e difficili da colpire: bonus a Destrezza e Carisma, capacità di passare '
              'inosservati. Sinergizza bene con classi agili o carismatiche.',
        ),
        _race(
          'Half-Elf',
          bonuses: {'CHA': 2},
          description:
              'Un piede in due mondi: bonus a Carisma, competenze extra. Flessibile con qualunque classe basata '
              'sul Carisma.',
        ),
        _race(
          'Tiefling',
          bonuses: {'INT': 1, 'CHA': 2},
          description:
              'Discendenza infernale ben visibile: bonus a Intelligenza e Carisma, resistenza al fuoco e un '
              'incantesimo innato. Sinergizza bene con classi arcane o carismatiche.',
        ),
      ]);
    });
  }
}

ClassesCompanion _class(
  String name, {
  required int hitDie,
  required List<String> savingThrows,
  required String spellcasting,
  required int skillChoices,
  required String description,
}) {
  return ClassesCompanion.insert(
    id: _uuid.v4(),
    name: name,
    hitDie: hitDie,
    source: const Value(DataSource.official),
    description: Value(description),
    dataJson: Value(classDataJson(savingThrows: savingThrows, spellcasting: spellcasting, skillChoices: skillChoices)),
  );
}

RacesCompanion _race(String name, {required Map<String, int> bonuses, required String description}) {
  return RacesCompanion.insert(
    id: _uuid.v4(),
    name: name,
    source: const Value(DataSource.official),
    description: Value(description),
    dataJson: Value(raceDataJson(abilityBonuses: bonuses)),
  );
}
