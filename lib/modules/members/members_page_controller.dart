import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/models/member_model.dart';

class MembersPageController extends GetxController {
  var members = <MemberModel>[].obs;

  final Stream<QuerySnapshot> membersStream =
      FirebaseFirestore.instance.collection('members').snapshots();

  parseMembers(List<QueryDocumentSnapshot> docs) {
    members.value =
        docs.map((member) => MemberModel.fromSnapshot(member)).toList();
  }

  static MembersPageController get to => Get.find();
}
