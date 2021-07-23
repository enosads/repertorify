import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:repertorify/shared/utils/string_utils.dart';

class AppCircleAvatar extends StatelessWidget {
  final String url;
  final String title;

  AppCircleAvatar({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => GFAvatar(
        backgroundImage: imageProvider,
        shape: GFAvatarShape.circle,
      ),
      placeholder: (context, url) => GFAvatar(
        child: Text(StringUtils.getInitials(title)),
      ),
      errorWidget: (context, url, error) => GFAvatar(
        child: Text(StringUtils.getInitials(title)),
      ),
    );
  }
}
