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
    switch (this) {
      case 'special':
        return 'SP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'speed':
        return 'SPD';
      case 'hp':
        return 'HP';
      case 'special-attack':
        return 'SP-ATK';
      case 'special-defense':
        return 'SP-DEF';
    }
    return '-';
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
      case 'psychic':
        return psychic;
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
