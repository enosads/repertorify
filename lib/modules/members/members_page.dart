import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/modules/members/members_page_controller.dart';
import 'package:repertorify/modules/members/widgets/members_list.dart';

class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MembersPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Repertorify'),
          ),
          body: MembersList(),
        );
      },
    );
  }
}
