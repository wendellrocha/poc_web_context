import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback callback;
  const FloatingActionButtonWidget(
      {Key? key, required this.child, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: context.theme.colorScheme.primary,
          onPressed: callback,
          child: child,
        ),
      ),
    );
  }
}
