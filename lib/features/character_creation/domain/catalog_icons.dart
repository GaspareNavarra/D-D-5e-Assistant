import 'package:flutter/widgets.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../data/local/tables/class_race_data_codec.dart';

/// Purely cosmetic icon per class/race name, with a sensible fallback
/// for anything not in the map (custom entries included).
IconData classIcon(String name) {
  return switch (name) {
    'Barbaro' => PhosphorIconsRegular.fire,
    'Bardo' => PhosphorIconsRegular.musicNotes,
    'Chierico' => PhosphorIconsRegular.shield,
    'Guerriero' => PhosphorIconsRegular.sword,
    'Paladino' => PhosphorIconsRegular.sparkle,
    'Ranger' => PhosphorIconsRegular.treeEvergreen,
    'Ladro' => PhosphorIconsRegular.maskHappy,
    'Mago' => PhosphorIconsRegular.flask,
    'Druido' => PhosphorIconsRegular.leaf,
    'Monaco' => PhosphorIconsRegular.handFist,
    'Stregone' => PhosphorIconsRegular.flame,
    'Warlock' => PhosphorIconsRegular.eyeClosed,
    _ => PhosphorIconsRegular.userCircle,
  };
}

IconData raceIcon(String name) {
  return switch (name) {
    'Umano' => PhosphorIconsRegular.personSimple,
    'Elfo dei Boschi' || 'Alto Elfo' || 'Elfo Scuro' => PhosphorIconsRegular.leaf,
    'Nano delle Colline' || 'Nano delle Montagne' => PhosphorIconsRegular.mountains,
    'Halfling Piedelesto' || 'Halfling Tascorobusto' => PhosphorIconsRegular.footprints,
    'Mezzelfo' => PhosphorIconsRegular.personSimple,
    'Tiefling' => PhosphorIconsRegular.fire,
    'Dragonide' => PhosphorIconsRegular.scales,
    'Gnomo delle Foreste' || 'Gnomo delle Rocce' => PhosphorIconsRegular.gear,
    'Mezzorco' => PhosphorIconsRegular.sword,
    _ => PhosphorIconsRegular.userCircle,
  };
}

/// Forward-looking hints for the class detail panel's "cosa deciderai
/// dopo" column — a lightweight, deterministic stand-in for real
/// SRD-driven guidance (which needs the SRD-import feature this project
/// doesn't have yet).
List<String> whatsNextHints(ClassData classData) {
  final hints = <String>['Scegli ${classData.skillChoices} abilità competenti al passo Equipaggiamento'];

  final fromLevel = classData.spellcastingFromLevel;
  if (fromLevel != null) {
    hints.add('I primi incantesimi arrivano dal livello $fromLevel');
  } else {
    hints.add('Nessun incantesimo da gestire: equipaggiamento e tattica al centro');
  }

  hints.add('Punteggi di caratteristica al passo successivo (point buy)');
  return hints;
}
