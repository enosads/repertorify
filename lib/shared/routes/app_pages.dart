import 'package:get/get.dart';
import 'package:repertorify/modules/choose_group/choose_group_page.dart';
import 'package:repertorify/modules/choose_group/choose_group_page_binding.dart';
import 'package:repertorify/modules/home/home_page.dart';
import 'package:repertorify/modules/home/home_page_binding.dart';
import 'package:repertorify/modules/join_group_code/join_group_code_page.dart';
import 'package:repertorify/modules/join_group_code/join_group_code_page_binding.dart';
import 'package:repertorify/modules/login/login_page.dart';
import 'package:repertorify/modules/login/login_page_binding.dart';
import 'package:repertorify/modules/splash/splash_page.dart';
import 'package:repertorify/modules/splash/splash_page_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: Routes.CHOOSE_GROUP,
      page: () => ChooseGroupPage(),
      binding: ChooseGroupPageBinding(),
    ),
    GetPage(
      name: Routes.JOIN_GROUP_CODE,
      page: () => JoinGroupCodePage(),
      binding: JoinGroupCodePageBinding(),
    ),
  ];
}
