import 'package:flutter/material.dart';

import '../const/color.dart';

extension StringManipulation on String {
  String getPokemonId() {
    return split('pokemon').last.replaceAll("/", "");
  }

  String getPokemonDescription() {
    return replaceAll('\n', ' ').replaceAll('\f', '');
  }

  String getPokemonStat() {
    return replaceAll('special', 'SP')
        .replaceAll('attack', 'ATK')
        .replaceAll('defense', 'DEF')
        .replaceAll('speed', 'SPD')
        .replaceAll('hp', 'HP');
  }
}

extension PokemonTypeExtension on String {
  Color toPokemonTypeColor() {
    switch (this) {
      case 'fire':
        return fire;
      case 'grass':
        return grass;
      case 'rock':
        return rock;
      case 'ghost':
        return ghost;
      case 'steel':
        return steel;
      case 'water':
        return water;
      case 'physic':
        return physic;
      case 'ice':
        return ice;
      case 'dark':
        return dark;
      case 'fairy':
        return fairy;
      case 'normal':
        return normal;
      case 'fighting':
        return fighting;
      case 'flying':
        return flying;
      case 'poison':
        return poison;
      case 'ground':
        return ground;
      case 'bug':
        return bug;
      case 'electric':
        return electric;
      case 'dragon':
        return dragon;
    }
    return grass;
  }
}
