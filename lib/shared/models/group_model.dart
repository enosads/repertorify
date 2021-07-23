import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  final String name;
  final String? photoUrl;
  final DocumentReference? ref;
  final List<DocumentReference> members;
  final DocumentReference creator;

  GroupModel(
      {required this.name,
      required this.members,
      this.photoUrl,
      required this.creator,
      this.ref});

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      members: map['members'],
      creator: map['creator'],
      ref: map['ref'],
    );
  }

  factory GroupModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return GroupModel(
      name: data['name'],
      photoUrl: data['photoUrl'],
      members: data['members'].cast<DocumentReference>(),
      creator: data['creator'],
      ref: documentSnapshot.reference,
    );
  }

  factory GroupModel.fromJson(String json) =>
      GroupModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoUrl": photoUrl,
        "members": members,
        "creator": creator,
        "ref": ref,
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'GroupModel{name: $name, photoUrl: $photoUrl, ref: $ref, members: $members, creator: $creator}';
  }
}
