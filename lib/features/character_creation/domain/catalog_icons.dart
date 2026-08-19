import 'package:flutter/widgets.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

import '../../../data/local/tables/class_race_data_codec.dart';

/// Purely cosmetic icon per class/race name, with a sensible fallback
/// for anything not in the map (custom entries included).
IconData classIcon(String name) {
  return switch (name) {
    'Barbarian' => PhosphorIconsRegular.fire,
    'Bard' => PhosphorIconsRegular.musicNotes,
    'Cleric' => PhosphorIconsRegular.shield,
    'Fighter' => PhosphorIconsRegular.sword,
    'Paladin' => PhosphorIconsRegular.sparkle,
    'Ranger' => PhosphorIconsRegular.treeEvergreen,
    'Rogue' => PhosphorIconsRegular.maskHappy,
    'Wizard' => PhosphorIconsRegular.flask,
    _ => PhosphorIconsRegular.userCircle,
  };
}

IconData raceIcon(String name) {
  return switch (name) {
    'Human' => PhosphorIconsRegular.personSimple,
    'Elf (Wood)' || 'Elf (High)' => PhosphorIconsRegular.leaf,
    'Dwarf (Hill)' || 'Dwarf (Mountain)' => PhosphorIconsRegular.mountains,
    'Halfling (Lightfoot)' => PhosphorIconsRegular.footprints,
    'Half-Elf' => PhosphorIconsRegular.personSimple,
    'Tiefling' => PhosphorIconsRegular.fire,
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
