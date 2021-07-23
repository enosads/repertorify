import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repertorify/shared/widgets/call_to_action.dart';

import 'choose_group_page_controller.dart';
import 'widgets/choose_group_actions.dart';
import 'widgets/groups_list.dart';

class ChooseGroupPage extends GetView<ChooseGroupPageController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Obx(
          () => controller.loaded.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CallToAction(
                        text: controller.groups.length == 0
                            ? 'Você ainda não está em nenhum grupo.'
                            : 'Selecione um grupo'),
                    GroupsList(),
                    ChooseGroupActions(),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
