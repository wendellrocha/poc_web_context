import 'package:flutter/material.dart';

class CustomPaddings extends ThemeExtension<CustomPaddings> {
  final EdgeInsets? sentMessagePadding;
  final EdgeInsets? receivedMessagePadding;
  final BorderRadius? sentMessageBorderRadius;
  final BorderRadius? receivedMessageBorderRadius;

  const CustomPaddings({
    this.sentMessagePadding,
    this.receivedMessagePadding,
    this.sentMessageBorderRadius,
    this.receivedMessageBorderRadius,
  });

  @override
  ThemeExtension<CustomPaddings> copyWith({
    EdgeInsets? sentMessagePadding,
    EdgeInsets? receivedMessagePadding,
    BorderRadius? sentMessageBorderRadius,
    BorderRadius? receivedMessageBorderRadius,
  }) {
    return CustomPaddings(
      sentMessagePadding: sentMessagePadding ?? this.sentMessagePadding,
      receivedMessagePadding:
          receivedMessagePadding ?? this.receivedMessagePadding,
      sentMessageBorderRadius:
          sentMessageBorderRadius ?? this.sentMessageBorderRadius,
      receivedMessageBorderRadius:
          receivedMessageBorderRadius ?? this.receivedMessageBorderRadius,
    );
  }

  @override
  ThemeExtension<CustomPaddings> lerp(
    ThemeExtension<CustomPaddings>? other,
    double t,
  ) {
    if (other is! CustomPaddings) {
      return this;
    }

    return CustomPaddings(
      sentMessagePadding: EdgeInsets.lerp(
        sentMessagePadding,
        other.sentMessagePadding,
        t,
      ),
      receivedMessagePadding: EdgeInsets.lerp(
        receivedMessagePadding,
        other.receivedMessagePadding,
        t,
      ),
      sentMessageBorderRadius: BorderRadius.lerp(
        sentMessageBorderRadius,
        other.sentMessageBorderRadius,
        t,
      ),
      receivedMessageBorderRadius: BorderRadius.lerp(
        receivedMessageBorderRadius,
        other.receivedMessageBorderRadius,
        t,
      ),
    );
  }
}
