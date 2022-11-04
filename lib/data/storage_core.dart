import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';

class StorageCore {
  StorageCore() {
      final storage = LocalStorage('local_data.json');
    Future<bool> ensureStorageReady() async {
      return await storage.ready;
    }
  }



}
