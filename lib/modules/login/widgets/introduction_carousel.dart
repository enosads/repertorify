import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:repertorify/shared/theme/app_colors.dart';

class IntroductionCarousel extends StatelessWidget {
  final List<String> imageList = [
    "https://pngimg.com/uploads/mario/mario_PNG53.png",
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg",
    "https://pngimg.com/uploads/mario/mario_PNG53.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GFCarousel(
        pagination: true,
        passiveIndicator: AppColors.primary,
        activeIndicator: AppColors.primaryLighter,
        height: Get.height * 0.60,
        enableInfiniteScroll: false,
        items: imageList.map(
          (url) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
              ),
              padding: EdgeInsets.only(bottom: 42),
            );
          },
        ).toList(),
      ),
    );
  }
}
