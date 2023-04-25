import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class BorderButtonWidget extends StatelessWidget {
  final String? title;
  final Color? color;
  final VoidCallback? callback;
  final bool? showProgress;
  final Color? borderColor;

  const BorderButtonWidget({
    Key? key,
    this.title,
    this.color,
    this.callback,
    this.showProgress = false,
    this.borderColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      width: context.querySize.width,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: color ?? context.theme.colorScheme.primary,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.all(0),
          side: BorderSide(
            color: borderColor ?? context.theme.colorScheme.primary,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        onPressed: !showProgress! ? callback! : () {},
        child: showProgress!
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
