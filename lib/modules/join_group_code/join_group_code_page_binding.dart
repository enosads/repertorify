import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'join_group_code_page_controller.dart';

class JoinGroupCodePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinGroupCodePageController());
  }
}
