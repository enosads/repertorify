import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:repertorify/shared/theme/app_colors.dart';
import 'package:repertorify/shared/theme/app_text_styles.dart';
import 'package:repertorify/shared/widgets/call_to_action.dart';

import 'join_group_code_page_controller.dart';

class JoinGroupCodePage extends GetView<JoinGroupCodePageController> {
  @override
  Widget build(BuildContext context) {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(5.0),
    );

    return Material(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(300),
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
              Container(
                child: CallToAction(text: 'Digite o código do grupo'),
              ),
              Container(
                margin: EdgeInsets.all(32),
                child: PinPut(
                  autofocus: true,

                  fieldsCount: 6,
                  focusNode: controller.pinPutFocusNode,
                  controller: controller.pinPutController,
                  textStyle: AppTextStyles.codeGroup,
                  submittedFieldDecoration: pinPutDecoration.copyWith(
                    color: AppColors.primary,
                  ),
                  selectedFieldDecoration: pinPutDecoration.copyWith(
                    color: Colors.white,

                    border: Border.all(
                      width: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  followingFieldDecoration: pinPutDecoration,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
