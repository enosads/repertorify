import 'package:flutter/material.dart';
import 'package:repertorify/modules/choose_group/choose_group_page_controller.dart';
import 'package:repertorify/shared/theme/app_text_styles.dart';

class ChooseGroupActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ChooseGroupPageController.to;
    return Container(
      margin: EdgeInsets.all(16),
      height: 112,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Crie um novo grupo',
              style: AppTextStyles.buttonGray,
            ),
          ),
          ListTile(
            onTap: controller.handleJoinGroupCode,
            leading: Icon(Icons.pin),
            title: Text(
              'Entre em um grupo existente',
              style: AppTextStyles.buttonGray,
            ),
          ),
        ],
      ),
    );
  }
}
