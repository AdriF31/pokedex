import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';

class StorageCore {
  final storage = LocalStorage('local_data.json');

  Future<bool> ensureStorageReady() async {
    return await storage.ready;
  }

  Future<PokemonDetailModel?> getFavoritePokemon() async {
    try {
      bool isStorageReady = await storage.ready;
      debugPrint('storage ready? $isStorageReady');
      if (isStorageReady) {
        Map<String, dynamic> data = storage.getItem('auth_result');
        PokemonDetailModel pokemon = PokemonDetailModel.fromJson(data);

        return pokemon;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('error get login state: $e');
      return null;
    }
  }

  Future saveFavoritePokemon(PokemonDetailModel? favoritePokemon) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem('auth_result', favoritePokemon?.toJson());
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  int? getPokemonId() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      PokemonDetailModel auth = PokemonDetailModel.fromJson(data);
      return auth.id;
    } catch (e) {
      debugPrint("Error while load user_id: $e");
      return null;
    }
  }

  String? getPokemonName() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      PokemonDetailModel auth = PokemonDetailModel.fromJson(data);

      return auth.name;
    } catch (e) {
      debugPrint("Error while load user_name: $e");
      return 'user_name_not_loaded';
    }
  }
}
