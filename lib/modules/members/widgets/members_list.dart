import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../members_page_controller.dart';
import 'member_tile.dart';

class MembersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = MembersPageController.to;
    return StreamBuilder<QuerySnapshot>(
      stream: controller.membersStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Erro ao buscar músicas'));
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        controller.parseMembers(snapshot.data!.docs);
        return Obx(
          () => ListView.builder(
            itemCount: controller.members.length,
            itemBuilder: (context, index) => MemberTile(
              controller.members[index],
            ),
          ),
        );
      },
    );
  }
}
