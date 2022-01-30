import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Подтверждение кода',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
