import 'package:flutter/material.dart';
import 'package:repertorify/modules/login/login_page_controller.dart';
import 'package:repertorify/shared/theme/app_colors.dart';
import 'package:repertorify/shared/theme/app_images.dart';
import 'package:repertorify/shared/theme/app_text_styles.dart';

class LoginWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = LoginPageController.to;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: InkWell(
        onTap: controller.handleGoogleSignIn,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(
              BorderSide(
                color: AppColors.stroke,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.google),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: AppColors.stroke,
                      )
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Entrar com Google",
                      style: AppTextStyles.buttonGray,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
