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
          'Barbaro',
          hitDie: 12,
          savingThrows: ['FOR', 'COS'],
          spellcasting: 'none',
          skillChoices: 2,
          description:
              'Guerriero primordiale che canalizza la furia in combattimento: alta resistenza, pochi fronzoli '
              'tattici. Buona scelta per chi vuole restare sempre in prima linea.',
        ),
        _class(
          'Bardo',
          hitDie: 8,
          savingThrows: ['DES', 'CAR'],
          spellcasting: 'full',
          skillChoices: 3,
          description:
              'Artista itinerante che intreccia magia e carisma: pochi incantesimi ma versatili, ottimo supporto '
              'al gruppo grazie a ispirazione ed effetti sociali.',
        ),
        _class(
          'Chierico',
          hitDie: 8,
          savingThrows: ['SAG', 'CAR'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              'Tramite della propria divinità: cura, protegge e può comunque reggere il confronto in mischia. '
              'Buona scelta per chi vuole un ruolo di supporto affidabile.',
        ),
        _class(
          'Guerriero',
          hitDie: 10,
          savingThrows: ['FOR', 'COS'],
          spellcasting: 'none',
          skillChoices: 2,
          description:
              'Combattente versatile e diretto: nessun incantesimo da gestire, solo tattica e acciaio. Ottimo '
              'primo personaggio per chi vuole concentrarsi sul combattimento.',
        ),
        _class(
          'Paladino',
          hitDie: 10,
          savingThrows: ['SAG', 'CAR'],
          spellcasting: 'partial',
          skillChoices: 2,
          description:
              'Guerriero sacro legato a un giuramento: mischia solida abbinata a incantesimi di supporto e '
              'protezione. Buon equilibrio tra potenza e resistenza.',
        ),
        _class(
          'Ranger',
          hitDie: 10,
          savingThrows: ['FOR', 'DES'],
          spellcasting: 'partial',
          skillChoices: 3,
          description:
              'Cacciatore dei confini: combatte a distanza, si muove senza lasciare traccia e conosce pochi '
              'incantesimi di natura. Buona scelta come primo personaggio: poche risorse da gestire a ogni turno.',
        ),
        _class(
          'Ladro',
          hitDie: 8,
          savingThrows: ['DES', 'INT'],
          spellcasting: 'none',
          skillChoices: 4,
          description:
              'Specialista della furtività e della precisione: colpisce dove fa più male e si tira fuori dai '
              'guai con abilità. Nessun incantesimo, molte opzioni non in combattimento.',
        ),
        _class(
          'Mago',
          hitDie: 6,
          savingThrows: ['INT', 'SAG'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              'Studioso della magia arcana: il ventaglio di incantesimi più ampio del gioco, ma fragile in '
              'mischia. Richiede più attenzione nella gestione delle risorse.',
        ),
        _class(
          'Druido',
          hitDie: 8,
          savingThrows: ['INT', 'SAG'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              "Tramite della natura selvaggia: incantesimi legati a elementi e creature, più la capacità di "
              "assumere forma animale. Buona scelta per chi vuole magia versatile fuori dai canoni arcani.",
        ),
        _class(
          'Monaco',
          hitDie: 8,
          savingThrows: ['FOR', 'DES'],
          spellcasting: 'none',
          skillChoices: 2,
          description:
              'Combattente a mani nude che incanala energia interiore (ki): mobilità e colpi rapidi al posto '
              "dell'armatura pesante. Richiede gestione attenta delle risorse di ki turno per turno.",
        ),
        _class(
          'Stregone',
          hitDie: 6,
          savingThrows: ['COS', 'CAR'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              'Incantatore con magia innata nel sangue: meno incantesimi conosciuti del Mago ma la possibilità di '
              'plasmarli con la metamagia. Fragile in mischia, richiede attenzione nella gestione dei punti stregoneria.',
        ),
        _class(
          'Warlock',
          hitDie: 8,
          savingThrows: ['SAG', 'CAR'],
          spellcasting: 'full',
          skillChoices: 2,
          description:
              'Incantatore legato a un patto con un\'entità superiore: pochi slot incantesimo ma sempre al livello '
              'più alto disponibile, oltre a invocazioni occulte personalizzabili. Stile di gioco compatto e diretto.',
        ),
      ]);
    });
  }

  final hasRaces = await (db.select(db.races)..limit(1)).get();
  if (hasRaces.isEmpty) {
    await db.batch((batch) {
      batch.insertAll(db.races, [
        _race(
          'Umano',
          bonuses: {'FOR': 1, 'DES': 1, 'COS': 1, 'INT': 1, 'SAG': 1, 'CAR': 1},
          description:
              'Versatili e adattabili: un piccolo bonus a tutte le caratteristiche, nessuna specializzazione '
              'marcata. Ottima scelta se non vuoi vincoli sulla build.',
        ),
        _race(
          'Elfo dei Boschi',
          bonuses: {'DES': 2, 'SAG': 1},
          description:
              'Elfo dei boschi, veloce e furtivo: bonus a Destrezza e Saggezza, affinità con la natura. '
              'Sinergizza bene con classi di mischia leggera o incantatori naturali.',
        ),
        _race(
          'Alto Elfo',
          bonuses: {'DES': 2, 'INT': 1},
          description:
              'Elfo colto e agile: bonus a Destrezza e Intelligenza, un trucchetto arcano innato. Sinergizza '
              "bene con classi che lanciano incantesimi con l'Intelligenza.",
        ),
        _race(
          'Nano delle Colline',
          bonuses: {'COS': 2, 'SAG': 1},
          description:
              'Nano resistente e saggio: bonus a Costituzione e Saggezza, resistenza al veleno. Sinergizza bene '
              'con classi che si affidano alla Saggezza.',
        ),
        _race(
          'Nano delle Montagne',
          bonuses: {'COS': 2, 'FOR': 2},
          description:
              'Nano forgiato per la battaglia: forte bonus a Costituzione e Forza, competenza con armature. '
              'Ottimo per build di mischia pesante.',
        ),
        _race(
          'Halfling Piedelesto',
          bonuses: {'DES': 2, 'CAR': 1},
          description:
              'Piccoli, fortunati e difficili da colpire: bonus a Destrezza e Carisma, capacità di passare '
              'inosservati. Sinergizza bene con classi agili o carismatiche.',
        ),
        _race(
          'Mezzelfo',
          bonuses: {'CAR': 2},
          description:
              'Un piede in due mondi: bonus a Carisma, competenze extra. Flessibile con qualunque classe basata '
              'sul Carisma.',
        ),
        _race(
          'Tiefling',
          bonuses: {'INT': 1, 'CAR': 2},
          description:
              'Discendenza infernale ben visibile: bonus a Intelligenza e Carisma, resistenza al fuoco e un '
              'incantesimo innato. Sinergizza bene con classi arcane o carismatiche.',
        ),
        _race(
          'Elfo Scuro',
          bonuses: {'DES': 2, 'CAR': 1},
          description:
              'Elfo delle profondità, abituato al buio: bonus a Destrezza e Carisma, scurovisione superiore e '
              'magia innata legata a Lolth. Sinergizza bene con classi agili o carismatiche.',
        ),
        _race(
          'Halfling Tascorobusto',
          bonuses: {'DES': 2, 'COS': 1},
          description:
              'Halfling più robusto della media, resistente al veleno: bonus a Destrezza e Costituzione. Buona '
              'scelta per un halfling più incline alla mischia.',
        ),
        _race(
          'Dragonide',
          bonuses: {'FOR': 2, 'CAR': 1},
          description:
              'Discendente umanoide dei draghi: bonus a Forza e Carisma, soffio elementale e resistenza al danno '
              'associato. Ottimo per build di mischia carismatiche.',
        ),
        _race(
          'Gnomo delle Foreste',
          bonuses: {'INT': 2, 'DES': 1},
          description:
              'Piccolo e furtivo, a suo agio nei boschi: bonus a Intelligenza e Destrezza, capacità di parlare '
              'con le piccole bestie. Sinergizza bene con incantatori arcani agili.',
        ),
        _race(
          'Gnomo delle Rocce',
          bonuses: {'INT': 2, 'COS': 1},
          description:
              'Ingegnoso e resistente: bonus a Intelligenza e Costituzione, talento per piccoli congegni '
              'meccanici. Sinergizza bene con classi arcane che vogliono un po\' più di resistenza.',
        ),
        _race(
          'Mezzorco',
          bonuses: {'FOR': 2, 'COS': 1},
          description:
              'Forte e resistente, cresciuto tra due mondi: bonus a Forza e Costituzione, attacchi implacabili '
              'in punto di morte. Ottimo per build di mischia pesante.',
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
