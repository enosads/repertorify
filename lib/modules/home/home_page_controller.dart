import 'package:get/get.dart';

class HomePageController extends GetxController {
  final selectedIndex = 0.obs;

  static HomePageController get to => Get.find();

  void handleSelectBottomNavigationBarIndex(int index) {
    selectedIndex.value = index;
  }
}
