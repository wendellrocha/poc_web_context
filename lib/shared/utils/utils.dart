import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static EdgeInsets get gridPadding => const EdgeInsets.all(5);

  static SliverGridDelegateWithFixedCrossAxisCount get gridDelegate {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 0.75,
    );
  }

  static bool isFunctionVoid<returnType>(returnType Function() fn) {
    Type getType<T>() => T;

    return returnType == getType<void>();
  }

  static dynamic getFunctionType<returnType>(returnType Function() fn) {
    Type getType<T>() => T;

    return getType<returnType>();
  }

  static String currencyFormat(num n) => NumberFormat.currency().format(n);
}

extension ObjectUtils<T> on T? {
  void get log => devtools.log(toString());

  /// Check if `this` is `null`;
  bool get isNull => this == null;

  /// Check if `this` is `null` and if `this` is not equal to `value`
  bool isNotEqual(T? value) => !isNull && this != value;
}

extension Capitalize on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension DetailedWhere<K, V> on Map<K, V> {
  Map<K, V> where(bool Function(K key, V value) f) => Map<K, V>.fromEntries(
        entries.where((entry) => f(entry.key, entry.value)),
      );

  Map<K, V> whereKey(bool Function(K key) f) =>
      {...where((key, value) => f(key))};
  Map<K, V> whereValue(bool Function(V value) f) =>
      {...where((key, value) => f(value))};
}

extension Util on BuildContext {
  ThemeData get theme => Theme.of(this);
  Size get querySize => MediaQuery.of(this).size;

  /// MediaQuery breakpoints
  bool get isSmall => querySize.width < 800;
  bool get isMedium => querySize.width >= 800 && querySize.width <= 1200;
  bool get isLarge => querySize.width > 1200;
  bool get isLargeOrMedium => isLarge || isMedium;
}

extension OptionalFirst<T> on Iterable<T> {
  T? get getFirst => isEmpty ? null : first;
}
