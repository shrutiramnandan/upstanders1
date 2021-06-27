import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageUrl;
  final double avatarRadius;

  const UserAvatar({Key key,@required this.imageUrl , @required this.avatarRadius}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: avatarRadius,
      width: avatarRadius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }
}

class UserAvatarAsset extends StatelessWidget {
  final String asset;
  final double avatarRadius;

  const UserAvatarAsset({Key key,@required this.asset , @required this.avatarRadius}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: avatarRadius,
      width: avatarRadius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover
        )
      ),
    );
  }
}