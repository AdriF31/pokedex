import 'package:flutter/material.dart';
import 'package:pokedex/binding/global_bindings.dart';
import 'package:pokedex/pokedex.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const Pokedex());
}
