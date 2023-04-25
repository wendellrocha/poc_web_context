import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ListTileWidget extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget child;
  final VoidCallback? onTap;
  final bool useMargin;
  final double? height;
  final bool hasShadow;

  const ListTileWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.leading,
    this.trailing,
    this.useMargin = false,
    this.height = 60,
    this.hasShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(0),
      margin: useMargin ? const EdgeInsets.only(bottom: 5) : null,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: context.theme.shadowColor.withOpacity(.1),
                  blurRadius: 5.0,
                  offset: const Offset(0.0, 5.0),
                ),
              ]
            : null,
      ),
      child: ListTile(
        hoverColor: context.theme.colorScheme.primary,
        minLeadingWidth: 20,
        isThreeLine: false,
        trailing: trailing,
        leading: leading,
        title: child,
        onTap: () => onTap?.call(),
      ),
    );
  }
}
