//ini class untuk dependency injection
import 'package:get/get.dart';
import 'package:pokedex/data/network_core.dart';
import 'package:pokedex/data/repository/repository.dart';
import 'package:pokedex/data/repository/repository_impl.dart';
import 'package:pokedex/data/storage_core.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());
    Get.put<StorageCore>(StorageCore());
  }
}
