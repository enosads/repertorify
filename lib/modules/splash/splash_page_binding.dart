import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
  }
}
