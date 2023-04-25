import 'package:flutter/material.dart';

class PopupWidget<T> extends StatelessWidget {
  final List<PopupMenuItem> items;
  final void Function(T) onSelected;

  final Offset offset;
  const PopupWidget({
    Key? key,
    required this.items,
    required this.onSelected,
    this.offset = const Offset(0, 40),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => items,
      onSelected: (value) => onSelected(value),
      offset: offset,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }
}
