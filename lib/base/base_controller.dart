import 'package:get/get.dart';
import 'package:pokedex/data/repository/repository.dart';

class BaseController extends GetxController{
   final Repository repository = Get.find<Repository>();
}