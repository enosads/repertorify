import 'package:get/get.dart';
import 'package:repertorify/shared/theme/app_colors.dart';

class AppToast {
  static error(String message) {
    Get.snackbar('Error', message,
        backgroundColor: AppColors.red, colorText: AppColors.white);
  }
}
