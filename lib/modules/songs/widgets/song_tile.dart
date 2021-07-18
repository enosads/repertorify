import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/songs/songs_page_controller.dart';
import 'package:repertorify/shared/models/song_model.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SongTile extends StatelessWidget {
  SongModel song;

  SongTile(this.song);

  @override
  Widget build(BuildContext context) {
    final controller = SongsPageController.to;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      title: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: SubstringHighlight(
                text: song.title,
                term: controller.search.value,
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textStyleHighlight: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
            Container(
              child: SubstringHighlight(
                text: song.singer ?? 'Desconhecido',
                term: controller.search.value,
                textStyle: TextStyle(
                  color: Colors.black,
                ),
                textStyleHighlight: TextStyle(color: Get.theme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
