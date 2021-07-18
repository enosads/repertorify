import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:repertorify/shared/models/member_model.dart';

class MemberTile extends StatelessWidget {
  MemberModel member;

  MemberTile(this.member);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      leading: CachedNetworkImage(
        imageUrl: member.avatarUrl ?? '',
        imageBuilder: (context, imageProvider) => GFAvatar(
          backgroundImage: imageProvider,
          shape: GFAvatarShape.circle,
        ),
        placeholder: (context, url) => GFAvatar(
          child: Text(member.nameInitials),
        ),
        errorWidget: (context, url, error) => GFAvatar(
          child: Text(member.nameInitials),
        ),
      ),
      title: Text(
        member.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
