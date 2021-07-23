import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:repertorify/shared/context/group_context.dart';

import 'splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupContext());
    Get.put(SplashPageController());
  }
}
