import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/const/color.dart';
import 'package:pokedex/data/model/pokemon_all_model.dart';
import 'package:pokedex/ui/detail/detail_page.dart';
import 'package:pokedex/ui/pokemon/pokemon_controller.dart';
import 'package:pokedex/helper/extension_method.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonController>(
        init: PokemonController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_pokeball.svg',
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pokedex",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            prefixIcon: const Icon(
                              Icons.search_outlined,
                              color: Colors.grey,
                            ),
                            hintText: "Cari Pokemon",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: PagedGridView<int, Results>(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                            newPageProgressIndicatorBuilder: (context) =>
                                const Center(
                                  child: CircularProgressIndicator.adaptive(
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.redAccent)),
                                ),
                            itemBuilder: (context, item, index) =>
                                GestureDetector(
                                  onTap: () => Get.to(() => const DetailPage(),
                                      arguments: {
                                        "id": item.url?.getPokemonId()
                                      }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: grass),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '#${controller.formatter.format(int.parse(item.url?.getPokemonId() ?? ''))}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Image.network(
                                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${item.url?.getPokemonId()}.png',
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
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
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            bottom:
                                                                Radius.circular(
                                                                    10))),
                                                child: Center(
                                                    child: Text(
                                                  item.name?.capitalizeFirst ??
                                                      '-',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ))))
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
