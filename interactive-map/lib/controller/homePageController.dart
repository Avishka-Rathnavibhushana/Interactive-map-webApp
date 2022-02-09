import 'package:get/get.dart';

class HomePageController extends GetxController {
  var show = 0.obs;

  void changeShow(int showVar) {
    if (showVar == 1) {
      show.value = 0;
    } else {
      show.value = 1;
    }
  }
}
