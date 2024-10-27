import 'package:flutter/material.dart';
import 'package:quizapp/results_details.dart';
import 'package:quizapp/styled_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.listOfAnswers, required this.onRestart});
  final List<Map<String, Object>> listOfAnswers;
  final void Function() onRestart;

  @override
  Widget build(context) {
    final correctAnswersCount = listOfAnswers
        .where((response) =>
            response['correct_answer'] == response['given_answer'])
        .toList()
        .length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              StyledText(
                'You got $correctAnswersCount answers correct!',
              ),
              const SizedBox(
                height: 20,
              ),
              ResultsDetails(listOfAnswers),
              ElevatedButton.icon(
                onPressed: onRestart,
                icon: const Icon(Icons.restart_alt_outlined),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 39, 1, 53),
                ),
                label: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ])));
  }
}
