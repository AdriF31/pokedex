import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/base/base_controller.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';
import 'package:pokedex/data/repository/repository.dart';

class DetailController extends BaseController {
  var isFavorite = false.obs;
  NumberFormat formatter = NumberFormat("#000");
  PokemonDetailModel? pokemonDetail = PokemonDetailModel();
  List<String?> pokemonDescription = [];
  List<Types> types = [];
  Set<String?> filter = {};
  dynamic argumentData = Get.arguments;
  GetStorage box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    _getPokemonDetail(int.parse(argumentData['id']));
    _getPokemonDescription(int.parse(argumentData['id']));
    await GetStorage.init();
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
      return null;
    }
  }

  Future _getPokemonDescription(int id) async {
    try {
      var res = await repository.getPokemonDescription(id);

      for (int index = 0; index <= res.flavorTextEntries!.length; index++) {
        if (res.flavorTextEntries?[index].language?.name == 'en') {
          pokemonDescription.add(res.flavorTextEntries?[index].flavorText);
        }
      }

      filter = pokemonDescription.toSet();
      pokemonDescription = filter.toList();

      update();
    } catch (e) {
      update();
      return null;
    }
  }

  void simpanPokemon(int id, String name) {
    if (isFavorite.isTrue) {
      box.write('favorite', {"id": id, "name": name});
    } else {
      box.remove('favorite');
    }
  }
}
