import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class AppToasts {
  dynamic showBottomToast(String text, BuildContext context,
      [bool isError = false]) {
    return showToast(
      text,
      context: context,
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.slideToBottom,
      startOffset: const Offset(0.0, 3.0),
      reverseEndOffset: const Offset(0.0, 3.0),
      position: StyledToastPosition.bottom,
      duration: const Duration(seconds: 4),
      animDuration: const Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor:
          isError ? Colors.red.shade700.withOpacity(0.75) : Colors.green,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
