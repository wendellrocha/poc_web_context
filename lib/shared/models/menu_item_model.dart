// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final String route;
  final List<MenuItemModel> children;

  const MenuItemModel({
    required this.icon,
    required this.title,
    required this.route,
    this.children = const [],
  });

  @override
  String toString() =>
      'MenuItemModel(title: $title, route: $route, childen: $children)';

  factory MenuItemModel.blank() =>
      const MenuItemModel(icon: Icons.delete, title: '', route: '');

  @override
  bool operator ==(covariant MenuItemModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.icon == icon &&
        other.title == title &&
        other.route == route &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return icon.hashCode ^ title.hashCode ^ route.hashCode ^ children.hashCode;
  }
}
