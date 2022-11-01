import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/helper/scroll_configuration.dart';
import 'package:pokedex/ui/splash/splash_page.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, child) {
          child =
              ScrollConfiguration(behavior: IosScrollBehavior(), child: child!);
          return child;
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage());
  }
}
