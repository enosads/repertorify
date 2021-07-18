import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
