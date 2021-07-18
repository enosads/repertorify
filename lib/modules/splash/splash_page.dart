import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/splash/splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Hero(
            tag: 'hero',
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 120.0,
              child: Image.asset(
                'assets/images/google.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
