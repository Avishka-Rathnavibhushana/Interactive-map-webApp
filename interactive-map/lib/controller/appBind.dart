import 'package:get/get.dart';
import 'package:interactive_map/controller/homePageController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
