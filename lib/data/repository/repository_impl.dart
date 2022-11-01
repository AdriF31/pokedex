import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pokedex/data/model/pokemon_all_model.dart';
import 'package:pokedex/data/model/pokemon_description_model.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';
import 'package:pokedex/data/network_core.dart';
import 'package:pokedex/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<PokemonAllModel?> getAllPokemon(int offset, int limit) async {
    try {
      var res = await network.dio
          .get("/pokemon", queryParameters: {"offset": offset, "limit": limit});

      return PokemonAllModel.fromJson(res.data);
    } on DioError catch (e) {
      return null;
    }
  }

  @override
  FutureOr<PokemonDetailModel> getPokemonDetail(int id) async {
    try {
      var res = await network.dio.get("/pokemon/$id");

      return PokemonDetailModel.fromJson(res.data);
    } on DioError catch (e) {
      return e.error;
    }
  }

  @override
  FutureOr<PokemonDescriptionModel> getPokemonDescription(int id) async {
    try {
      var res = await network.dio.get("/pokemon-species/$id");
      print(res.data);
      return PokemonDescriptionModel.fromJson(res.data);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
