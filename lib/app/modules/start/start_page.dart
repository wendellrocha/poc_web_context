import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/shared/models/menu_item_model.dart';
import '/shared/utils/drawer_items.dart';
import '/shared/utils/utils.dart';
import '/shared/widgets/default_app_bar/default_app_bar_widget.dart';
import '/shared/widgets/drawer/drawer_widget.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  String title = '';

  void routerListener() {
    if (!mounted) {
      return;
    }

    final path = Modular.to.path;
    final childRoutes =
        path.split('/').where((element) => element.isNotEmpty).toList();

    if (childRoutes.length > 2) {
      return;
    }

    setState(() {
      title = DrawerItems.items.firstWhere(
        (element) => element.route == path,
        orElse: () {
          var selectedItem = MenuItemModel.blank();

          for (final item in DrawerItems.items) {
            if (item.children.isNotEmpty) {
              selectedItem = item.children.firstWhere(
                (element) => element.route == path,
                orElse: () => MenuItemModel.blank(),
              );
            }
          }

          return selectedItem;
        },
      ).title;
    });
  }

  void getTitle() {
    final path = Modular.to.path;
    final routes = path.split('/');
    routes.removeWhere((element) => element.isEmpty);
    title = routes.last;
  }

  @override
  void initState() {
    super.initState();
    Modular.routerDelegate.addListener(routerListener);
    getTitle();
  }

  @override
  void didChangeDependencies() {
    getTitle();

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
      appBar: context.isSmall
          ? DefaultAppBarWidget(title: title.capitalize())
          : null,
      drawer: context.isSmall ? DrawerWidget(items: DrawerItems.items) : null,
      body: Row(
        children: [
          if (context.isLargeOrMedium) DrawerWidget(items: DrawerItems.items),
          Expanded(
            child: Column(
              children: [
                if (context.isLargeOrMedium)
                  DefaultAppBarWidget(
                    title: title.capitalize(),
                    callbackButton: null,
                  ),
                const Expanded(
                  child: RouterOutlet(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
