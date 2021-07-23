import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:repertorify/shared/context/user_context.dart';

import 'choose_group_page_controller.dart';

class ChooseGroupPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserContext());
    Get.put(ChooseGroupPageController());
  }
}
