import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel {
  final String title;
  final DocumentReference? ref;
  final String? singer;

  SongModel({required this.title, this.singer, this.ref});

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map['title'],
      singer: map['singer'],
      ref: map['ref'],
    );
  }

  factory SongModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return SongModel(
      title: data['title'],
      singer: data['singer'],
      ref: documentSnapshot.reference,
    );
  }

  factory SongModel.fromJson(String json) =>
      SongModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "title": title,
        "singer": singer,
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'SongModel{title: $title, singer: $singer}';
  }
}
