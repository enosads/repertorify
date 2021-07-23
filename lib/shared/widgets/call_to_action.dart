import 'package:flutter/material.dart';
import 'package:repertorify/shared/theme/app_text_styles.dart';

class CallToAction extends StatelessWidget {
  final String text;

  CallToAction({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(32),
      child: Text(
        text,
        style: AppTextStyles.callToAction,
      ),
    );
  }
}
