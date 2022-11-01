import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/ui/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => Scaffold(
              body: Center(
                  child: Lottie.asset('assets/images/pokeball_lottie.json',
                      width: 100)),
            ));
  }
}
