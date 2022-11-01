import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/ui/detail/detail_controller.dart';
import 'package:pokedex/helper/extension_method.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (controller) => Scaffold(
            backgroundColor: controller.types.isNotEmpty
                ? controller.types[0].type?.name?.toPokemonTypeColor()
                : Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title:
                  Text(controller.pokemonDetail?.name?.capitalizeFirst ?? '-'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                      child: Text(
                    '#${controller.formatter.format(controller.pokemonDetail?.id ?? 0)}',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )),
                )
              ],
            ),
            body: controller.pokemonDescription.isNotEmpty &&
                    controller.pokemonDetail!.stats!.isNotEmpty &&
                    controller.pokemonDetail!.types!.isNotEmpty
                ? SizedBox(
                    height: Get.size.height,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/icons/ic_pokeball.svg',
                            height: 250,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(20),
                          width: Get.size.width,
                          height: Get.size.height * 0.6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.isFavorite.value =
                                            !controller.isFavorite.value;
                                      },
                                      child: Icon(
                                        controller.isFavorite.value == true
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: Colors.red,
                                        size: 34,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 25,
                                child: Center(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.types.length,
                                      itemBuilder: (context, index) =>
                                          controller.types.isNotEmpty
                                              ? Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 8),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 3),
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                          .types[index]
                                                          .type
                                                          ?.name
                                                          ?.toPokemonTypeColor(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    controller.types[index].type
                                                            ?.name ??
                                                        '',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              : Container()),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'About',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/ic_weight.svg',
                                              width: 20),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(controller.pokemonDetail?.weight)! / 10} Kg')
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Weight',
                                        style:
                                            GoogleFonts.poppins(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/ic_height.svg',
                                              width: 10),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              '${(controller.pokemonDetail?.height)! / 10} m')
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Height',
                                        style:
                                            GoogleFonts.poppins(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '${controller.pokemonDescription[0].flavorText?.getPokemonDescription()} ${controller.pokemonDescription[2].flavorText?.getPokemonDescription()}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Base Stats',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                flex: 3,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      controller.pokemonDetail?.stats?.length,
                                  itemBuilder: ((context, index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                              .pokemonDetail
                                                              ?.stats?[index]
                                                              .stat
                                                              ?.name
                                                              ?.getPokemonStat() ??
                                                          '',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        controller
                                                                .pokemonDetail
                                                                ?.stats?[index]
                                                                .baseStat
                                                                .toString() ??
                                                            '',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 12)),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                flex: 5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child:
                                                          LinearProgressIndicator(
                                                        minHeight: 7,
                                                        backgroundColor: controller
                                                            .types[0].type?.name
                                                            ?.toPokemonTypeColor()
                                                            .withOpacity(0.3),
                                                        color: controller
                                                            .types[0].type?.name
                                                            ?.toPokemonTypeColor(),
                                                        value: (controller
                                                                .pokemonDetail
                                                                ?.stats?[index]
                                                                .baseStat)! /
                                                            255,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -10,
                          child: Column(
                            children: [
                              Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.pokemonDetail?.id}.png',
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
