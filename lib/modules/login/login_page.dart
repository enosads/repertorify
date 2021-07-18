import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/login/widgets/login_with_google_button.dart';
import 'package:repertorify/shared/theme/app_colors.dart';

import 'login_page_controller.dart';
import 'widgets/introduction_carousel.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.primaryDarker,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroductionCarousel(),
            LoginWithGoogleButton(),
          ],
        ),
      ),
    );
  }
}
