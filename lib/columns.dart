import 'package:flutter/material.dart';
import 'package:quizapp/styled_text.dart';

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder(this.startQuiz, {super.key});
  final void Function() startQuiz;

  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
          ),
        ),
        const StyledText('Play the Quizzer game!'),
        ElevatedButton.icon(
          onPressed: () {
            startQuiz();
          },
          icon: const Icon(Icons.arrow_right_alt),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 39, 1, 53),
          ),
          label: const Text(
            'Start',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
