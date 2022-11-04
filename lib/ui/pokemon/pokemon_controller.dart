import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/base/base_controller.dart';
import 'package:pokedex/data/model/pokemon_all_model.dart';

class PokemonController extends BaseController {
  NumberFormat formatter = NumberFormat("#000");

  static const limit = 9;

  final PagingController<int, Results> pagingController =
      PagingController(firstPageKey: 0);

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await repository.getAllPokemon(pageKey, limit);

      final isLastPage = newItems!.results!.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results!);
      } else {
        final nextPageKey = pageKey + newItems.results!.length;
        pagingController.appendPage(newItems.results!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
