//ini class untuk dependency injection
import 'package:get/get.dart';
import 'package:pokedex/data/network_core.dart';
import 'package:pokedex/data/repository/repository.dart';
import 'package:pokedex/data/repository/repository_impl.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());
  }
}
