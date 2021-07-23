import 'package:flutter/material.dart';
import 'package:repertorify/shared/theme/app_text_styles.dart';
import 'package:repertorify/shared/widgets/app_circle_avatar.dart';

import '../choose_group_page_controller.dart';

class GroupCard extends StatelessWidget {
  final int index;

  GroupCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = ChooseGroupPageController.to;
    final group = controller.groups[index];
    return Container(
      margin: EdgeInsets.all(16),
      height: 80,
      child: Card(
        child: InkWell(
          onTap: () => controller.handleChooseGroup(index),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                AppCircleAvatar(
                  url: group.photoUrl ?? '',
                  title: group.name,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      group.name,
                      style: AppTextStyles.groupCardName,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
