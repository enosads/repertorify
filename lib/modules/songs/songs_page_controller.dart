import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/models/song_model.dart';

class SongsPageController extends GetxController {
  final tSearch = new TextEditingController();
  final search = ''.obs;
  var allSongs = <SongModel>[];
  var searchedSongs = <SongModel>[].obs;

  final Stream<QuerySnapshot> songsStream =
      FirebaseFirestore.instance.collection('songs').snapshots();

  parseSongs(List<QueryDocumentSnapshot> docs) {
    allSongs = docs.map((song) => SongModel.fromSnapshot(song)).toList();
    searchedSongs = allSongs.obs;
  }

  handleSearchSong(String value) {
    search.value = value;
    searchedSongs.clear();
    allSongs.forEach(
      (SongModel song) {
        var lowerCaseSearch = search.value.toLowerCase();
        var lowerCaseTitle = song.title.toLowerCase();
        var lowerCaseSinger = song.singer?.toLowerCase() ?? '';

        if (lowerCaseTitle.contains(lowerCaseSearch) ||
            lowerCaseSinger.contains(lowerCaseSearch)) {
          searchedSongs.add(song);
        }
      },
    );
  }

  handleCleanSearch() {
    search.value = '';
    tSearch.text = '';
    searchedSongs.clear();
    searchedSongs.addAll(allSongs);
  }

  static SongsPageController get to => Get.find();
}
