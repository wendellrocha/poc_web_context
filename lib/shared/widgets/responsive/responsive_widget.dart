import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../models/menu_item_model.dart';
import '../../utils/utils.dart';
import '../default_app_bar/default_app_bar_widget.dart';
import '../drawer/drawer_widget.dart';

class ResponsiveWidget extends StatefulWidget {
  final String pageTitle;
  final List<MenuItemModel> items;
  final Widget largeScreen;
  final Widget smallScreen;
  final bool enableAppBar;
  final bool enableDrawer;
  final void Function()? appBarCallback;

  const ResponsiveWidget({
    Key? key,
    required this.pageTitle,
    required this.items,
    required this.largeScreen,
    required this.smallScreen,
    this.enableAppBar = true,
    this.enableDrawer = true,
    this.appBarCallback,
  }) : super(key: key);

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  String title = '';

  void routerListener() {
    if (!mounted) {
      return;
    }

    setState(() {
      title = widget.items.firstWhere(
        (element) => element.route == Modular.to.path,
        orElse: () {
          late final MenuItemModel selectedItem;

          for (final item in widget.items) {
            if (item.children.isNotEmpty) {
              selectedItem = item.children.firstWhere(
                (element) => element.route == Modular.to.path,
                orElse: () => MenuItemModel.blank(),
              );
            }
          }

          return selectedItem;
        },
      ).title;
    });
  }

  @override
  void initState() {
    super.initState();
    Modular.routerDelegate.addListener(routerListener);
  }

  @override
  void didChangeDependencies() {
    if (title.isEmpty) {
      title = 'To-do';
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Modular.routerDelegate.removeListener(routerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.isSmall && widget.enableAppBar
          ? DefaultAppBarWidget(
              title: title.capitalize(),
              callbackButton: widget.appBarCallback,
            )
          : null,
      drawer: context.isSmall && widget.enableDrawer
          ? DrawerWidget(items: widget.items)
          : null,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1200 ||
                (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800)) {
              return Row(
                children: [
                  DrawerWidget(items: widget.items),
                  Expanded(
                    child: Column(
                      children: [
                        DefaultAppBarWidget(
                          title: title.capitalize(),
                          callbackButton: null,
                        ),
                        Expanded(
                          child: widget.largeScreen,
                        )
                      ],
                    ),
                  ),
                ],
              );
            }

            return widget.smallScreen;
          },
        ),
      ),
    );
  }
}
