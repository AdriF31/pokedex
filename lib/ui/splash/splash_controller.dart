import 'dart:async';

import 'package:get/get.dart';
import 'package:pokedex/ui/pokemon/pokemon_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3),
        () => Get.offAll(() => const PokemonPage()));
  }
}
