import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.textValue, {super.key});

  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        textValue,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
