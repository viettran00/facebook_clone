import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  bool isActive;
  Function()? onTap;

  ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 25.0,
            foregroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(imageUrl),
          ),
          isActive ? Positioned(
            bottom: 15.0,
            right: 0.0,
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: BoxDecoration(
                  color: Palette.online,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0)),
            ),
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
