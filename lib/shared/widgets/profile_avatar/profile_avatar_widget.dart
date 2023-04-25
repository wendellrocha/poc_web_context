import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String avatar;
  final VoidCallback changeAvatar;
  final double height;
  final double width;
  final double radius;
  const ProfileAvatarWidget({
    super.key,
    required this.avatar,
    required this.changeAvatar,
    this.height = 150,
    this.width = 150,
    this.radius = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.theme.colorScheme.primary,
              width: 1.5,
            ),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: avatar.contains('assets')
                ? AssetImage(avatar)
                : NetworkImage(avatar) as ImageProvider,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.theme.colorScheme.primary,
            ),
            child: Center(
              child: IconButton(
                onPressed: () => changeAvatar.call(),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
