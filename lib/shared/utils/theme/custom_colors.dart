import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? messageReceivedColor;

  const CustomColors({required this.messageReceivedColor});

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? messageReceivedColor,
  }) =>
      CustomColors(
        messageReceivedColor: messageReceivedColor ?? this.messageReceivedColor,
      );

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      messageReceivedColor: Color.lerp(
        messageReceivedColor,
        other.messageReceivedColor,
        t,
      ),
    );
  }
}
