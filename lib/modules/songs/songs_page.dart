import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/songs/widgets/songs_list.dart';

import 'songs_page_controller.dart';
import 'widgets/songs_search_bar.dart';

class SongsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: GetBuilder(
        init: SongsPageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: SongsSearchBar(),
            ),
            body: SongsList(),
          );
        },
      ),
    );
  }
}
