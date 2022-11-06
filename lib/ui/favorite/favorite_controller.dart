// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:intl/intl.dart';
// import 'package:pokedex/data/model/pokemon_detail_model.dart';
// import 'package:pokedex/data/repository/repository.dart';
// import 'package:pokedex/data/storage_core.dart';

// import '../../data/model/pokemon_all_model.dart';

// class FavoriteController extends GetxController {
//   final Repository repository = Get.find<Repository>();
//   NumberFormat formatter = NumberFormat("#000");
//   PokemonAllModel? pokemonAllModel = PokemonAllModel();
//   List<Results> favPokemon = [];
//   static const limit = 10;
//   final storage = StorageCore();
//   final box = GetStorage('favorite');

//   final PagingController<int, Results> pagingController =
//       PagingController(firstPageKey: 0);

//   @override
//   void onInit() async {
//     super.onInit();
//     await GetStorage.init();
//     _getFavorite();
//   }

//   Future _getFavorite() async {
//     try {
//       var res = await repository.getAllPokemon(0, 1000);

//       pokemonAllModel = res;
//       for (int i = 0; i < pokemonAllModel!.results!.length; i++) {
//         if (pokemonAllModel?.results?[i].name == box.val('id')) {
//           favPokemon.add(pokemonAllModel.results);
//         }
//       }

//       update();
//     } catch (e) {
//       update();
//       return null;
//     }
//   }
// }
