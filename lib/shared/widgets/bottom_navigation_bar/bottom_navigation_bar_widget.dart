import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../typedefs/typedefs.dart';
import '../../utils/utils.dart';
import 'bottom_navigation_item_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final MenuItems items;
  final int currentIndex;
  final Function(int) onTap;
  final bool hasFAB;

  const BottomNavigationBarWidget({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
    this.hasFAB = false,
  })  : assert(currentIndex >= 0, 'Invalid index'),
        super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.theme.platform == TargetPlatform.android
          ? kBottomBarHeight
          : kBottomBarHeightCupertino,
      child: BottomAppBar(
        elevation: 4,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        color: context.theme.colorScheme.background,
        notchMargin: 5,
        child: SafeArea(
          minimum: context.theme.platform == TargetPlatform.android
              ? EdgeInsets.zero
              : const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: context.theme.platform == TargetPlatform.android
                ? kBottomBarHeight
                : kBottomBarHeightCupertino,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: _builder(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _builder() {
    final itemCount = widget.items.length;

    List<Widget> items = [];

    for (int i = 0; i < itemCount; i++) {
      items.add(
        BottomNavigationItemWidget(
          icon: widget.items[i].icon,
          onTap: () => widget.onTap.call(i),
          title: widget.items[i].title,
        ),
      );

      if (widget.hasFAB && i == itemCount - 1) {
        // Adiciona um gap entre o fab e os itens
        items.add(const SizedBox(width: 72));
      }
    }

    return items;
  }
}
