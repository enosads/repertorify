import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:repertorify/modules/home/home_page_controller.dart';
import 'package:repertorify/modules/members/members_page.dart';
import 'package:repertorify/modules/songs/songs_page.dart';

import 'widgets/app_bottom_navigation_bar.dart';

class HomePage extends GetView<HomePageController> {
  final pages = [
    Container(color: Colors.red),
    SongsPage(),
    MembersPage(),
    Container(color: Colors.deepPurple)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
