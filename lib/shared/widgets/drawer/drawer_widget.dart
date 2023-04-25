// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../constants/constants.dart';
import '../../models/menu_item_model.dart';
import '../../utils/utils.dart';

class DrawerWidget extends StatefulWidget {
  final List<MenuItemModel> items;
  final MenuItemModel? logoutItem;
  final AsyncCallback? logoutCallback;
  final double width;

  const DrawerWidget({
    Key? key,
    required this.items,
    this.logoutItem,
    this.logoutCallback,
    this.width = 250,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late String currentRoute;
  late final Animation<double> animation;

  void routerListener() {
    if (!mounted) {
      return;
    }

    setState(() {
      currentRoute = Modular.to.path;
    });
  }

  @override
  void initState() {
    super.initState();
    Modular.routerDelegate.addListener(routerListener);
  }

  @override
  void didChangeDependencies() {
    currentRoute = Modular.to.path;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: widget.width,
      child: Column(
        children: [
          SizedBox(
            height: kBottomBarHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FlutterLogo(size: 30),
                  const SizedBox(width: 20),
                  Text(
                    'PoC',
                    style: context.theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final selected = item.route == currentRoute;

                if (item.children.isNotEmpty) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: ListTileTheme(
                      horizontalTitleGap: 16,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 20),
                        child: ExpansionTile(
                          leading: Icon(item.icon),
                          title: Text(item.title),
                          childrenPadding: const EdgeInsets.only(left: 16),
                          children: item.children.map((child) {
                            final selected = child.route == currentRoute;

                            return ListTile(
                              horizontalTitleGap: 16,
                              isThreeLine: false,
                              leading: Icon(
                                child.icon,
                                color: selected
                                    ? context.theme.colorScheme.primary
                                    : context.theme.textTheme.labelSmall!.color!
                                        .withOpacity(0.8),
                              ),
                              title: Text(item.title),
                              selected: selected,
                              onTap: () => Modular.to.navigate(child.route),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                }

                return ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 20),
                  child: ListTile(
                    isThreeLine: false,
                    leading: Icon(
                      item.icon,
                      color: selected
                          ? context.theme.colorScheme.primary
                          : context.theme.textTheme.labelSmall!.color!
                              .withOpacity(0.8),
                    ),
                    title: Text(item.title),
                    selected: selected,
                    onTap: () => Modular.to.navigate(item.route),
                  ),
                );
              },
            ),
          ),
          if (widget.logoutItem != null)
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 20),
              child: ListTile(
                isThreeLine: false,
                leading: Icon(widget.logoutItem!.icon),
                title: Text(widget.logoutItem!.title),
                onTap: () async {
                  if (widget.logoutCallback != null) {
                    await widget.logoutCallback!.call();
                  }

                  Modular.to.navigate(widget.logoutItem!.route);
                },
              ),
            )
        ],
      ),
    );
  }
}
