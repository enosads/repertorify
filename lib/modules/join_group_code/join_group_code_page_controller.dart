import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinGroupCodePageController extends GetxController {
  final FocusNode pinPutFocusNode = FocusNode();
  final TextEditingController pinPutController = TextEditingController();

  @override
  void onInit() {}

  static JoinGroupCodePageController get to => Get.find();
}
