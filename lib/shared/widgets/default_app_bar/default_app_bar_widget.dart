import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/utils.dart';

class DefaultAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final VoidCallback? callbackButton;
  final Color? backgroundColor;
  final Color? titleColor;

  const DefaultAppBarWidget({
    Key? key,
    required this.title,
    this.actions,
    this.elevation,
    this.bottom,
    this.callbackButton,
    this.backgroundColor,
    this.titleColor,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<DefaultAppBarWidget> createState() => _DefaultAppBarWidgetState();
}

class _DefaultAppBarWidgetState extends State<DefaultAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      actions: widget.actions,
      elevation: widget.elevation,
      bottom: widget.bottom,
      leading: Modular.to.canPop() || widget.callbackButton != null
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.callbackButton != null
                    ? () => widget.callbackButton!.call()
                    : () => Modular.to.pop(),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 4),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Scaffold.of(context).hasDrawer
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : null,
      title: Text(
        widget.title,
        style: TextStyle(
          color: widget.titleColor,
        ),
      ),
    );
  }
}
