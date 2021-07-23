import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/context/group_context.dart';
import 'package:repertorify/shared/routes/app_pages.dart';

class SplashPageController extends GetxController {
  static SplashPageController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    await Firebase.initializeApp();
    await Future.delayed(Duration(seconds: 1));
    await _handleSelectNextPage();
  }

  _handleSelectNextPage() {
    if (FirebaseAuth.instance.currentUser != null) {
      once(GroupContext.to.loaded, (value) {
        if (GroupContext.to.group != null) {
          Get.offAndToNamed(Routes.HOME);
        } else {
          Get.offAndToNamed(Routes.CHOOSE_GROUP);
        }
      });
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
