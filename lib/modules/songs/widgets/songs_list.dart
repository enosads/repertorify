import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/songs/songs_page_controller.dart';
import 'package:repertorify/modules/songs/widgets/song_tile.dart';

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = SongsPageController.to;
    return StreamBuilder<QuerySnapshot>(
      stream: controller.songsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erro ao buscar músicas'));
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        controller.parseSongs(snapshot.data!.docs);
        return Obx(
          () => ListView.builder(
            itemCount: controller.searchedSongs.length,
            itemBuilder: (context, index) => SongTile(
              controller.searchedSongs[index],
            ),
          ),
        );
      },
    );
  }
}
