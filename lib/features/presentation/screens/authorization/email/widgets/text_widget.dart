import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Вход по Почте',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
