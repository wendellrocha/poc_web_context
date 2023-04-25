import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  final Function onTap;
  const BottomNavigationItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.theme.platform == TargetPlatform.android
            ? kBottomBarHeight
            : kBottomBarHeightCupertino,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onTap.call(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 9,
                    color: color,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
