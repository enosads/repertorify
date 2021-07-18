import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  final DocumentReference? ref;
  final String name;
  final String? avatarUrl;

  MemberModel({required this.name, this.avatarUrl, this.ref});

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      name: map['name'],
      avatarUrl: map['avatarUrl'],
      ref: map['ref'],
    );
  }

  factory MemberModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return MemberModel(
      name: data['name'],
      avatarUrl: data['avatarUrl'],
      ref: documentSnapshot.reference,
    );
  }

  factory MemberModel.fromJson(String json) =>
      MemberModel.fromMap(jsonDecode(json));

  get nameInitials {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = 2;

    if(2 < names.length) {
      numWords = names.length;
    }
    for(var i = 0; i < numWords; i++){
      initials += '${names[i][0]}';
    }
    return initials;
  }



  Map<String, dynamic> toMap() => {
        "name": name,
        "avatarUrl": avatarUrl,
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'MemberModel{name: $name, avatarUrl: $avatarUrl}';
  }
}
