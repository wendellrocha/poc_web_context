import 'package:flutter/material.dart';

import '../models/menu_item_model.dart';

class DrawerItems {
  static final List<MenuItemModel> items = List.from([
    const MenuItemModel(
      icon: Icons.task,
      title: 'To-do',
      route: '/start/todos/',
    ),
    const MenuItemModel(
      icon: Icons.inventory_sharp,
      title: 'Products',
      route: '/start/products/',
    ),
    const MenuItemModel(
      icon: Icons.comment,
      title: 'Comments',
      route: '/start/comments/',
    ),
    const MenuItemModel(
      icon: Icons.format_quote,
      title: 'Quotes',
      route: '/start/quotes/',
    ),
  ], growable: false);

  static const MenuItemModel logoutItem = MenuItemModel(
    icon: Icons.logout,
    title: 'Logout',
    route: '/auth/',
  );
}
