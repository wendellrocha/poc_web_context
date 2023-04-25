import 'package:flutter/material.dart';

mixin $Statefull<T extends StatefulWidget> on State<T> {
  ThemeData get theme => Theme.of(context);
  Size get querySize => MediaQuery.of(context).size;
}
