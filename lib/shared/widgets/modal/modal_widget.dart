import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../../utils/utils.dart';
import '../border_button/border_button_widget.dart';
import '../solid_button/solid_button_widget.dart';

part 'bottom_dialog_widget.dart';
part 'dialog_widget.dart';

class ModalWidget extends StatelessWidget {
  final String title;
  final String text;
  final String assetImage;
  final String buttonOkTitle;
  final Function buttonOkCallback;
  final String? buttonCancelTitle;
  final Function? buttonCancelCallback;
  final double height;
  final double width;
  final double? modalWidth;
  final double modalHeight;
  final bool isBottomModal;
  final bool hasOptions;

  ModalWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.buttonOkTitle,
    required this.buttonOkCallback,
    this.buttonCancelTitle,
    this.buttonCancelCallback,
    this.assetImage = Images.ops,
    this.height = 200,
    this.width = 200,
    this.modalWidth = 450,
    this.modalHeight = 420,
    this.isBottomModal = true,
    this.hasOptions = true,
  })  : assert(() {
          if (hasOptions && (buttonCancelCallback == null)) {
            throw AssertionError(
              'If hasOptions is true, buttonOkTitle and buttonOkCallback'
              ' must not be null',
            );
          }
          return true;
        }()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: isBottomModal
          ? _BottomDialogWidget(
              title: title,
              text: text,
              assetImage: assetImage,
              buttonOkTitle: buttonOkTitle,
              buttonOkCallback: buttonOkCallback,
              buttonCancelTitle: buttonCancelTitle,
              buttonCancelCallback: buttonCancelCallback,
              height: height,
              width: width,
              modalWidth: modalWidth,
              modalHeight: modalHeight,
              hasOptions: hasOptions,
            )
          : _DialogWidget(
              title: title,
              text: text,
              assetImage: assetImage,
              height: height,
              width: width,
              modalWidth: modalWidth,
              buttonOkTitle: buttonOkTitle,
              buttonOkCallback: buttonOkCallback,
              buttonCancelTitle: buttonCancelTitle,
              buttonCancelCallback: buttonCancelCallback,
              modalHeight: modalHeight,
              hasOptions: hasOptions,
            ),
    );
  }
}
