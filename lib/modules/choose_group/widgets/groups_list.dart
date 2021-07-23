import 'package:flutter/material.dart';

import '../choose_group_page_controller.dart';
import 'group_card.dart';

class GroupsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ChooseGroupPageController.to;

    return controller.groups.length != 0
        ? Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        GroupCard(index: index, ),
                    childCount: controller.groups.length, // 1000 list items
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
