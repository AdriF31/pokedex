import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/data/model/pokemon_description_model.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';
import 'package:pokedex/data/repository/repository.dart';

class DetailController extends GetxController {
  final Repository repository = Get.find<Repository>();
  NumberFormat formatter = NumberFormat("#000");
  PokemonDetailModel? pokemonDetail = PokemonDetailModel();
  List<FlavorTextEntries> pokemonDescription = [];
  List<Types> types = [];
  dynamic argumentData = Get.arguments;
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getPokemonDetail(int.parse(argumentData['id']));
    _getPokemonDescription(int.parse(argumentData['id']));

    update();
  }

  Future _getPokemonDetail(int id) async {
    try {
      var res = await repository.getPokemonDetail(id);

      pokemonDetail = res;
      for (var element in (pokemonDetail?.types as List)) {
        types.add(element);
      }

      update();
    } catch (e) {
      update();
      return [];
    }
  }

  Future _getPokemonDescription(int id) async {
    try {
      var res = await repository.getPokemonDescription(id);

      for (var element in (res.flavorTextEntries as List<dynamic>)) {
        pokemonDescription.add(element);
      }
      update();
    } catch (e) {
      update();
      return [];
    }
  }


}
