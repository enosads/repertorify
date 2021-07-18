import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/home/home_page_controller.dart';

class AppBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = HomePageController.to;
    return Obx(
      () => BottomNavyBar(
        selectedIndex: controller.selectedIndex.value,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: controller.handleSelectBottomNavigationBarIndex,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Agenda'),
            activeColor: Get.theme.accentColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Repertório'),
            activeColor: Get.theme.accentColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text(
              'Membros',
            ),
            activeColor: Get.theme.accentColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
            activeColor: Get.theme.accentColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
