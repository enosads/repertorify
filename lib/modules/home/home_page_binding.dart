import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
