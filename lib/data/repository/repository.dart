import 'dart:async';
import 'package:pokedex/data/model/pokemon_all_model.dart';
import 'package:pokedex/data/model/pokemon_description_model.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';

abstract class Repository {
  FutureOr<PokemonAllModel?> getAllPokemon(int offset, int limit);
  FutureOr<PokemonDetailModel> getPokemonDetail(int id);
  FutureOr<PokemonDescriptionModel> getPokemonDescription(int id);

}
