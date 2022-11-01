import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/const/color.dart';
import 'package:pokedex/data/model/pokemon_all_model.dart';
import 'package:pokedex/ui/detail/detail_page.dart';
import 'package:pokedex/ui/favorite/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text("favorite"),
              ),
              body: PagedGridView<int, Results>(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 120 / 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                ),
                padding: EdgeInsets.zero,
                pagingController: controller.pagingController,
                builderDelegate: PagedChildBuilderDelegate<Results>(
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        )),
                    newPageProgressIndicatorBuilder: (context) => const Center(
                          child: CircularProgressIndicator.adaptive(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.redAccent)),
                        ),
                    itemBuilder: (context, item, index) => GestureDetector(
                          onTap: () => Get.to(() => const DetailPage(),
                              arguments: {
                                "id": controller.storage.getPokemonId()
                              }),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: grass),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '#${controller.formatter.format(controller.storage.getPokemonId() ?? 0)}',
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Image.network(
                                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.storage.getPokemonId()}}.png',
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                        child: Lottie.asset(
                                      'assets/images/pokeball_lottie.json',
                                      width: 50,
                                    ));
                                  }),
                                ),
                                Flexible(
                                    flex: 2,
                                    child: Container(
                                        width: double.infinity,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: grass,
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(10))),
                                        child: Center(
                                            child: Text(
                                          item.name?.capitalizeFirst ?? '-',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ))))
                              ],
                            ),
                          ),
                        )),
              ),
            ));
  }
}
